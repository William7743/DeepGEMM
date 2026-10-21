# Official mxvs INT8 cross-check on the full C500

User-requested exact command, using AppImage extraction mode because libfuse.so.2 is unavailable; no system packages were installed:

    APPIMAGE_EXTRACT_AND_RUN=1 /opt/maca/bin/mxvs ops --devices 0 --models int8 --detail

Device: full 64GB MetaX C500, sGPU disabled, BDF 0000:12:00.0. MACA 3.7.1.5, KMD 3.8.30, VBIOS 1.33.5.0. No visible GPU job before execution. An exclusive local benchmark lock was held; no profiler or compiler ran concurrently. One-second management telemetry captured.

Official tool exit code: 0. Reported INT8 result: **478.39 TOPS**. Tool defaults were used except device/model/detail; iteration count was not overridden. This is one mxvs invocation, not three independently repeated tool runs. Its internal measurement, operation counting and correctness-check implementation were not source-audited.

| Measurement | INT8 TOPS |
|---|---|
|Official mxvs ops, current run|478.39|
|Our fixed full-card long run, GPU Event|477.047168|
|Our fixed full-card long run, CPU wall|477.039410|

The official tool value is 0.281488% above our historical Event value. The two tests report close throughput on this environment, around 477-478 TOPS. This is an independent-tool cross-check, not same-round paired measurement with identical timing/validation scopes. Historical data is unchanged; this does not establish an absolute hardware upper bound or explain unverified 560 TOPS claims from other sources.

The wrapper elapsed time includes startup and AppImage unpacking and is not used to calculate TOPS. The value above is the tool-reported number. No clocks or power limits were manually modified. One-second telemetry contains idle/startup as well as execution snapshots; it cannot prove every instruction ran at a single frequency.

Telemetry summary: {"telemetry_samples": 7, "core_mhz_min": 428.0, "core_mhz_max": 1125.0, "max_temperature_c": 40.0, "max_board_power_w": 160.662}

Official manual: https://developer.metax-tech.com/api/client/document/preview/333/C500_mxvsManual_CN.html
Official community example (INT8 478.38 TOPS): https://developer.metax-tech.com/blog/b3on8377hp8xqqi6k94py8yn

command.json preserves arguments, environment override, UTC timestamps and executable SHA256. Raw tool output and pre/post device snapshots are preserved. Raw records ZIP preserves exact byte hashes independently of Git newline conversions.
