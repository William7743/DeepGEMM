#!/usr/bin/env python3
"""Read-only environment collection. A visible management card is not a usable GPU."""
import argparse
import ctypes
import json
import os
from pathlib import Path
import platform
import subprocess
from datetime import datetime
from zoneinfo import ZoneInfo


def command(argv):
    try:
        result = subprocess.run(argv, capture_output=True, text=True, timeout=20)
        return {"exit_code": result.returncode, "stdout": result.stdout, "stderr": result.stderr}
    except (OSError, subprocess.TimeoutExpired) as exc:
        return {"error": str(exc)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--require-gpu", action="store_true", help="exit 77 if GPU unavailable")
    args = parser.parse_args()
    report = {
        "timestamp": datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        "hostname": platform.node(), "python": platform.python_version(),
        "mx_smi": command(["mx-smi"]),
        "sgpu_mode": command(["mx-smi", "sgpu", "--show-mode"]),
        "sgpu_usage": command(["mx-smi", "sgpu", "--show-usage"]),
        "gpu_ready": False,
    }
    runtime_path = Path(os.environ.get("MACA_PATH", "/opt/maca")) / "lib/libmcruntime.so"
    try:
        runtime = ctypes.CDLL(str(runtime_path))
        runtime.mcGetDeviceCount.argtypes = [ctypes.POINTER(ctypes.c_int)]
        runtime.mcGetDeviceCount.restype = ctypes.c_int
        runtime.mcGetErrorString.argtypes = [ctypes.c_int]
        runtime.mcGetErrorString.restype = ctypes.c_char_p
        count = ctypes.c_int()
        status = runtime.mcGetDeviceCount(ctypes.byref(count))
        report["maca_runtime"] = {
            "status": status, "count": count.value,
            "message": runtime.mcGetErrorString(status).decode(errors="replace"),
        }
    except (OSError, AttributeError) as exc:
        report["maca_runtime"] = {"error": str(exc)}
    try:
        import torch
        report["torch"] = {"version": torch.__version__, "available": torch.cuda.is_available(),
                           "device_count": torch.cuda.device_count()}
        if torch.cuda.is_available():
            props = torch.cuda.get_device_properties(0)
            report["torch"]["device_name"] = props.name
            report["torch"]["total_memory_bytes"] = props.total_memory
            # Exercise allocation and a kernel; management visibility alone is insufficient.
            value = torch.arange(4, device="cuda:0", dtype=torch.float32).sum().item()
            report["torch"]["smoke_sum"] = value
            report["gpu_ready"] = value == 6.0
    except Exception as exc:
        report.setdefault("torch", {})["error"] = str(exc)
    text = json.dumps(report, ensure_ascii=False, indent=2)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    print(text)
    return 77 if args.require_gpu and not report["gpu_ready"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
