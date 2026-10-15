#!/usr/bin/env python3
"""Materialize upstream M-grouped dimensions as reproducible INT8 inputs.

Dimension source: tests/generators.py at upstream commit
1fc9c66975ee322d628b3288534ca0e9ce12a64d, lines 194-226.
Counts follow its int(expected_m * uniform(0.7, 1.3)) rule, with an
independent fixed seed. These are generated tests, not model traces.
Contiguous INT8 uses packed valid rows, without upstream layout padding.
"""
import json
from pathlib import Path
import random

COMMIT = "1fc9c66975ee322d628b3288534ca0e9ce12a64d"


def generate():
    rng = random.Random(20261015)
    shapes = []
    for layout, groups in (("contiguous", [(4, 8192), (8, 4096)]),
                           ("masked", [(32, 192), (6, 1024), (32, 20), (6, 20)])):
        for g, expected in groups:
            for n, k in ((6144, 7168), (7168, 3072), (4096, 4096), (4096, 2048)):
                shape = dict(name=f"{layout}_g{g}_m{expected}_n{n}_k{k}",
                             layout=layout, counts=[int(expected*rng.uniform(.7, 1.3)) for _ in range(g)],
                             n=n, k=k, expected_m=expected,
                             source=f"upstream_generated_dimensions:{COMMIT}:tests/generators.py:194-226;INT8_adaptation",
                             count_seed=20261015)
                if layout == "masked":
                    shape["capacity"] = 4096
                shapes.append(shape)
    return shapes


if __name__ == "__main__":
    destination = Path(__file__).with_name("upstream_shapes.json")
    destination.write_text(json.dumps(generate(), indent=2) + "\n", encoding="utf-8")
    print(destination)
