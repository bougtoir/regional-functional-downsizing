# Functional geography under demographic contraction

Reproducible research package for:

> **When Moving People Is Costly, Move Functions: Infrastructure Downsizing under Relocation Frictions in Shrinking Societies**

The study asks when a shrinking region should preserve inherited assets, consolidate settlements, move service functions, or relax administrative service boundaries. Japan's Chugoku region is used as an empirical test bed. All cost outcomes are normalized planning indices, not yen.

## Reproduce

```bash
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
make analysis
```

`make analysis` downloads and verifies the analytical public inputs, preprocesses
geography and service points, runs the optimization and sensitivity analyses,
validates results, and builds figures and tables. `make all` also creates the
manuscript and submission archive when the private manuscript-building modules are
present.

Continuous sensitivity parameters are rounded to the configured decimal precision
before solving. The pipeline stops if any primary, transition, or sensitivity solve
misses its declared MIP-gap tolerance.

## Study design

- Population: WorldPop 2020 unconstrained 1-km grid.
- Administrative geography: Japan National Land Numerical Information (NLNI) 2025 boundaries.
- Healthcare assets: NLNI 2020 medical institutions.
- Study area: Tottori, Shimane, and Okayama prefectures, selected before outcome analysis to capture contiguous coastal, mountainous, rural, and urban-rural settings.
- Scenarios: asset preservation (A), settlement consolidation (B), functional provision (C), and functional-region optimization (D).
- Relocation friction sweep: 0, 0.25, 0.5, 1, 2, 4, 8, and 16, with transition refinement.
- Depopulation stress tests: 0%, 20%, 40%, and 60%.

The analysis does not estimate psychological or cultural relocation costs. Relocation friction is a dimensionless shadow-cost parameter. Service modes are planning abstractions with explicit eligibility and capacity limits; they are not clinical recommendations.

## Layout

- `config/`: centralized assumptions and scenario definitions
- `data/raw/`: immutable downloaded source snapshots and acquisition ledger
- `data/interim/`, `data/processed/`: reproducible derivatives
- `src/`: pipeline modules
- `tests/`: unit and integration tests
- `outputs/`: generated figures, tables, diagnostics, and logs
- `manuscript/`: local generated submission files when manuscript modules are present
- `docs/`: local provenance, model, decisions, and audit records

The public repository is intentionally limited to the analytical reproduction
code, configuration, tests, and data-acquisition code. Raw source snapshots,
generated outputs, manuscript prose, and journal-submission files are not
redistributed there.

## License

Code is MIT licensed. Third-party data retain their original source terms, which are
recorded in the machine-readable acquisition ledger created under `data/raw/`.
