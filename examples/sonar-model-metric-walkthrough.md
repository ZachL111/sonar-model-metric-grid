# Sonar Model Metric Grid Walkthrough

This walk-through keeps the domain vocabulary close to the data instead of burying it in prose.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | feature drift | 144 | ship |
| stress | window width | 193 | ship |
| edge | metric stability | 197 | ship |
| recovery | explainability | 126 | watch |
| stale | feature drift | 214 | ship |

Start with `stale` and `recovery`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around window width and explainability.
