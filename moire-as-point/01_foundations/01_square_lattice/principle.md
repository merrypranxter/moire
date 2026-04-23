# Square Lattice Moiré

## The Archetype

This is the foundational moiré technique: two (or more) regular square grids overlaid with slight differences in scale, offset, or rotation. The grids themselves are nearly invisible; the emergent interference patterns are what you actually watch.

## Why It Works

When two periodic structures with slightly different spatial frequencies overlap, the human visual system resolves the *difference frequency* as large-scale bands, rings, or checkerboards. This is pure wave interference — spatial aliasing made visible.

The key insight: **the pattern moves more than the source**. A tiny sub-pixel drift between grids creates sweeping moiré bands that traverse the entire viewport. The grids are the "code"; the moiré is the "runtime."

## Mathematical Core

Given two gratings:
- Grating 1: `sin(2π * f1 * x)`
- Grating 2: `sin(2π * f2 * x)`

Their product contains terms at `f1 + f2` (sum frequency, usually invisible) and `f1 - f2` (difference frequency — the moiré). When `f1 ≈ f2`, the difference frequency is *low*, creating wide, slow-moving bands from fine, fast-moving grids.

## Parameters That Control the Effect

| Parameter | Effect |
|-----------|--------|
| Scale differential | Controls fringe size. Tiny difference = huge emergent patterns |
| Relative offset | Controls fringe position. Sub-pixel precision required for smoothness |
| Relative rotation | Creates diagonal/chevron patterns instead of straight bands |
| Grid density | Higher density = more fine structure within fringes |
| Blending mode | Additive = bright fringes where all align; Multiplicative = dark fringes |
| Contrast push | Moiré is subtle; aggressive tonal curves make fringes pop |

## The Compusophy Reading

> "Reality isn't the things — it's the relationships between things."

The grids are invisible infrastructure. The moiré is the visible world. The motion is time. The interference is causality.
