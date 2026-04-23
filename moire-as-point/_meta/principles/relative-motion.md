# Principle: Relative Motion > Absolute Motion

## The Insight

The moiré pattern moves *more* and *faster* than either grid individually. A tiny sub-pixel drift between two grids creates sweeping bands that traverse the entire viewport.

## The Mathematics

Given two gratings with frequencies `f1` and `f2`, moving at velocities `v1` and `v2`:
- Grid 1 phase: `φ1 = 2π * f1 * (x - v1 * t)`
- Grid 2 phase: `φ2 = 2π * f2 * (x - v2 * t)`

The moiré phase (difference frequency):
```
φ_moire = φ1 - φ2 = 2π * [(f1 - f2) * x - (f1*v1 - f2*v2) * t]
```

The moiré velocity:
```
v_moire = (f1*v1 - f2*v2) / (f1 - f2)
```

When `f1 ≈ f2`, the denominator is tiny, so `v_moire` is *huge* — even if `v1` and `v2` are small.

## The Paradox

You can create fast-moving patterns from *static* grids by changing their relative phase. The motion is not in the grids — it's in their *relationship*.

## Applications

- **Efficient animation:** Two slow-drifting grids create fast moiré without heavy computation
- **Micro-motion amplification:** Tiny physical movements (breathing, heartbeat) become visible through moiré magnification
- **Parallax without depth:** Relative motion between layers creates depth illusion without 3D geometry

## The Compusophy Reading

> "The pattern moves more than the source."

This is the fundamental moiré paradox: the emergent entity has properties (speed, scale, complexity) that exceed any of its components. The whole is not just greater than the sum — it's *different in kind*.
