# Principle: Scale Differential Controls Fringe Size

## The Law

Tiny scale differences between grids create *huge* emergent patterns. The moiré fringe spacing is:
```
fringe_spacing = 1 / |f1 - f2|
```

When `f1 = 40` and `f2 = 40.2`, the fringe spacing is `1/0.2 = 5` units — much larger than the grid spacing of `1/40 = 0.025` units.

## The Scale Hierarchy

| Scale Ratio | Fringe Size | Visual Effect |
|-------------|-------------|---------------|
| 1:1.001 | ~1000x grid size | Giant, slow bands |
| 1:1.01 | ~100x grid size | Large, sweeping patterns |
| 1:1.1 | ~10x grid size | Medium, clear bands |
| 1:2 | ~1x grid size | Fine, dense interference |
| 1:10 | ~0.1x grid size | No visible moiré (too fine) |

The "sweet spot" for visible moiré is scale ratios between 1:1.01 and 1:1.5.

## Multi-Scale Moiré

With three+ layers, you get interference at multiple scales simultaneously:
- Layer 1&2: large-scale moiré (small frequency difference)
- Layer 2&3: medium-scale moiré
- Layer 1&3: fine-scale moiré (large frequency difference)

The result is **hierarchical interference** — patterns within patterns, like Russian dolls of aliasing.

## The Compusophy Reading

> "Tiny scale differences = huge emergent patterns."

This is the moiré version of the butterfly effect: microscopic differences in the source create macroscopic differences in the output. The artist controls the invisible to shape the visible.
