# sonar-model-metric-grid

`sonar-model-metric-grid` keeps a focused Haskell implementation around ml utilities. The project goal is to create a Haskell reference implementation for metric workflows, centered on simulation kernel, seeded input scenarios, and deterministic summary checks.

## Why This Exists

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Sonar Model Metric Grid Review Notes

The first comparison I would make is `feature drift` against `explainability` because it shows where the rule is most opinionated.

## Capabilities

- `fixtures/domain_review.csv` adds cases for feature drift and window width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/sonar-model-metric-walkthrough.md` walks through the case spread.
- The Haskell code includes a review path for `feature drift` and `explainability`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Implementation Shape

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Haskell code keeps the review rule close to the tests.

## Local Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Verification

The same command runs the local verification path. The highest-scoring domain case is `stale` at 214, which lands in `ship`. The most cautious case is `recovery` at 126, which lands in `watch`.

## Roadmap

No external service is required. A deeper version would add more negative cases and a clearer boundary around invalid input.
