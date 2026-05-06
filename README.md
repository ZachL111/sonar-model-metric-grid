# sonar-model-metric-grid

`sonar-model-metric-grid` explores ml utilities in Haskell. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Sonar Model Metric Grid Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Why This Exists

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Feature Notes

- Models feature signals with deterministic scoring and explicit review decisions.
- Uses fixture data to keep metric checks changes visible in code review.
- Includes extended examples for windowed behavior, including `surge` and `degraded`.
- Documents explainable outputs tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Implementation Notes

The design is intentionally direct: parse or construct a signal, score it, classify it, and verify the expected branch. This makes the repository useful for studying ml utilities behavior without needing a service or database unless the language project itself is SQL. The Haskell code keeps the pure scoring function isolated so tests can check it without setup.

## Code Tour

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Local Setup

The only required setup is the local Haskell toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Example Scenarios

The extended cases are not random smoke tests. `degraded` keeps pressure on the review path, while `surge` shows the model when capacity and weight are strong enough to clear the threshold.

## Boundaries

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.

## Roadmap

- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add one more ml utilities fixture that focuses on a malformed or borderline input.
