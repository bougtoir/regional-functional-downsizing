# Regional Studies final-revision plan

## Baseline and scope

The revision starts from commit `553224b541dbc91b7c8d3320a127f9333aa25bc0`
on branch `devin/1790262822-reproducibility-validation`. The working tree was
clean, the submission ZIP passed `unzip -t`, and the analytical result hashes
matched the existing analysis manifest before any revision edit.

The valid primary model and completed analyses are preserved. A core-model
correction (class D) will be made only if targeted validation demonstrates a
material defect. The default response is the smallest defensible class A–C
change.

Change classes:

- **A** — prose, positioning, interpretation, or documentation;
- **B** — re-tabulation, relabelling, or replotting from existing canonical data;
- **C** — targeted new analysis using the existing model or a bounded validation;
- **D** — core-model correction and propagation through the full analysis.

## Issue map

| Issue | Existing evidence | Class | Planned action | Principal affected files | Re-analysis? | Completion criterion |
|---|---|---:|---|---|---|---|
| Travel-time proxy | Primary travel time is planar distance × 1.35 / 40 km/h; no road-network comparison existed | C; D rejected after validation | Pin and retain an open Chūgoku road-network snapshot; use the full 144-cluster central Scenario-D census rather than a sample; compute network times, rank correlation, absolute/relative error, 45-minute agreement, density/prefecture/boundary/time-band strata, island/ferry exclusions, and central nearest-facility stability | `src/download/`, `src/validation/`, `config/analysis.yaml`, `data/raw/`, `outputs/validation/`, methods, supplement, `DATA_SOURCES.md`, `LIMITATIONS.md` | Targeted validation completed; no primary rerun required | Completed: Spearman rho 0.962, 97.9% pair and 99.5% population-weighted threshold agreement, and stable cross-boundary direction; no headline contradiction |
| 70.0% interpretation | Central A/D values are generated, but manuscript and cover letter use abbreviated “cost reduction” wording and Figure 6 uses “savings” in its filename/title | A+B | Recompute from canonical rows and use “70.0% lower normalized model objective” everywhere; remove fiscal/ROI implications; rename Figure 6 outputs | manuscript builder, package builder, figures, captions, tables, supplement, audits | No optimization rerun | Every occurrence is lineage-backed and uses normalized-objective language |
| Meaning of “move functions” | Framework emphasizes mobile/digital while central mobile share is zero | A+B | Define the term as service-geography/catchment, cross-boundary assignment, eligible digital/mobile provision, and fixed-site reconfiguration; distinguish resident movement, physical service movement, and catchment reconfiguration; state mobile = 0 centrally | Figure 1, Figure 4, Introduction, theory, Results, Discussion, Conclusion, supplement | No optimization rerun | Central mechanism is described as catchment/geography reconfiguration plus limited digital substitution, not mobile dominance |
| Regional Studies positioning | Current paper mentions functional regions and cooperation but the regional research gap and territorial mismatch can be sharper | A | Reframe the causal chain from demographic contraction to efficient spatial scale and administrative/functional mismatch; develop modular governance while retaining municipalities; verify journal scope and only add verified literature | Introduction, theory, Discussion, cover letter, `LITERATURE_AUDIT.md`, journal audit | No | A Regional Studies editor can identify a substantive subnational, conceptually informed, empirically grounded regional contribution |
| Capacity and MFG | Locations and beds are observed, but capacity conversions and planned-hub capacity are model assumptions; central solution has 46 sites and zero MFG violation | A+C | Audit construction and provenance; run a predeclared targeted capacity-multiplier grid at the central Scenario-D setting; report sites, feasibility, cross-boundary share, provision shares, and binding capacity | config, analysis/diagnostics, tables, supplement, manuscript, assumptions/model docs | Completed targeted solves | Completed: all five runs met the solver gate and zero MFG violation; open sites ranged 42–49, cross-boundary share 16.7%–18.9%, digital share 3.3%–6.5%, relocation 0.1%–1.1%, and mobile remained zero |
| RF transition | Coarse results change near RF 2 and refinement exists, but scaling dependence was not directly demonstrated | A+C | Derive transition intervals; run a relocation-cost normalization rescaling check and show the numerical RF location rescales while the qualitative switch remains | analysis/diagnostics, tables, Figure 3, manuscript, supplement | Completed targeted diagnostic | Completed: the largest coarse transition remains at effective RF 1–2 and shifts to nominal RF 2–4, 1–2, and 0.5–1 under coefficient multipliers 0.5, 1, and 2 |
| Designed sensitivity | Existing 96-draw LHS/Spearman design is adequate for broad designed ranges but can be mistaken for probabilistic uncertainty | A+C | Label ranges as designed, correlations as descriptive importance measures, and the exercise as global parameter sensitivity; inspect deterministic leave-one-fold-out rank stability | Figure 7, Table 5, methods, Results, supplement, assumptions | Completed diagnostic; no extra draws | Completed: each outcome's leading driver remained first in all four deterministic holdouts; retain 96 draws and avoid precise claims about lower-ranked ordering |
| Fairness | MFG and travel Gini are defined, but normative limits need greater prominence | A | State that MFG is one auditable floor, not a complete distributive-justice theory; travel Gini measures modeled resident travel burden; alternative fairness specifications can alter optima; preserve local validation requirement | theory, methods, Discussion, limitations, supplement | No | Fairness claims are bounded and measurement scope is explicit |
| Abstract and conclusion | Current abstract is concise but over-centres the objective difference and omits proof-of-concept/network limitations and mobile-zero mechanism | A | Rewrite after analytical revisions stabilize, retaining exact generated values and Regional Studies framing | manuscript builder | No | Abstract includes the requested framework, setting, conditional results, regime transition, functional geography, non-coercive interpretation, and proof-of-concept boundary within the verified limit |
| Figures and tables | Seven figures/five tables are generated; zero mobile use and transition intervals are not sufficiently legible; Figure 6 says savings | B | Rebuild from canonical outputs with explicit zero/near-zero rendering, dominant-link definition, normalized-objective labels, designed-sensitivity title, capacity diagnostics, and empirical/assumption labels | figure/table builders, editable sources, manuscript captions | Targeted outputs only | Completed: seven figures and six tables now expose the RF refinement, zero mobile share, dominant-assignment scope, normalized-objective reduction, designed sensitivity, input/assumption status, and capacity robustness |
| References and journal requirements | Twenty references were checked in the prior audit; live author-instruction endpoint was previously blocked | A | Refresh authoritative scope/instructions and Taylor & Francis policies; verify each reference metadata and attributed claim; confirm numbering, mentions, file structure, anonymization, figures/tables, data/code and AI statements | journal/literature downloaders and audits, manuscript/package | Metadata refresh only | All references and journal facts are verified or explicitly marked as portal-controlled |
| Numerical lineage and hard-coded results | Main analytical values are generated, but labels and some audit expectations are manually fixed | A+B | Trace every reported quantity to configuration or generated outputs; search and remove stale duplicated analytical constants; extend final audit to revised claims and files | manuscript/figure/table builders, final audit, `NUMERIC_AUDIT.md` | No core rerun | Manuscript, supplement, cover letter, tables and figures agree with canonical outputs |
| Reproducibility and final package | Existing public pipeline and package passed prior gates | B | Regenerate only affected outputs using verified caches; run tests, lint, solver gates, archive checks, and a clean public reproduction; exclude raw/private/temporary material from the release | Makefile, README, docs, package manifest, ZIP | Affected stages plus final clean reproduction | G1–G15 pass and the clean ZIP contains only intended files |
| Hostile review | Prior general reviews exist but not the four required final perspectives | A | Conduct separate editor, regional-science, spatial-optimization, and skeptical-policy reviews before mechanical final checks; resolve all avoidable major issues | `REVISION_RESPONSE_INTERNAL.md`, final QC and affected source documents | No | No unresolved avoidable desk-rejection or predictable major methodological issue |

## Predefined decision rules

### Travel validation

1. Use a dated Geofabrik Chūgoku OpenStreetMap PBF snapshot, not an ephemeral
   routing API.
2. Persist the original PBF and its checksum in `data/raw`; never overwrite it.
3. Select validation pairs before viewing network errors:
   - the central Scenario-D dominant destination for every demand cluster;
   - proxy-nearest and network-nearest central open fixed facilities for every
     cluster;
   - strata for prefecture, density tercile, within/cross-boundary assignment,
     and proxy-time band, with unreachable island routes reported separately.
4. Road-network times will use documented OSM highway/ferry eligibility and
   reproducible default speeds where `maxspeed` is missing.
5. Island pairs requiring absent or schedule-dependent ferry service will be
   reported separately and not assigned invented travel times.
6. A disagreement is material enough to trigger class D only if it both:
   - materially changes 45-minute accessibility classification or central
     dominant-assignment ordering for a substantial share of represented
     demand; and
   - undermines the direction of a headline comparative conclusion rather than
     merely changing travel-time levels.

### Capacity robustness

Use the existing sensitivity range as the predeclared targeted grid:
capacity multipliers `0.6, 0.8, 1.0, 1.2, 1.4`, with Scenario D, no synthetic
decline, and central RF. Record solver status/gap, open fixed sites, MFG slack,
cross-boundary share, digital/mobile/relocation shares, and capacity use.

### RF scaling

Use deterministic relocation-cost coefficient multipliers `0.5, 1.0, 2.0`.
Interpret the effective RF as the product of RF and the coefficient multiplier.
The expected diagnostic is a horizontal rescaling of the transition, not a new
behavioral estimate.

### Sensitivity sample size

The 96-draw design will remain canonical unless deterministic rank-stability
diagnostics show that leading absolute Spearman ranks are unstable enough to
change the manuscript interpretation. Additional draws, if needed, will be a
targeted diagnostic rather than probabilistic uncertainty quantification.

## Checkpoints

1. Baseline and revision plan.
2. Targeted network validation — completed; class D was not triggered.
3. Capacity/RF/sensitivity diagnostics — completed; no class-D correction or
   sensitivity-sample expansion was triggered.
4. Revised figures and tables — completed.
5. Manuscript, supplement, and submission-document propagation — completed.
6. Reference, numerical, integrity, hostile-review, and journal audits —
   completed; 74/74 programmatic checks pass and no avoidable major scientific
   issue remains.
7. Final reproducibility build and package — completed; publication, PR update,
   and public synchronization remain.
