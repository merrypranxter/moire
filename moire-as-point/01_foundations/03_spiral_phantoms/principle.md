# Spiral Moiré — The Rotating Phantom

## The Phenomenon

Two Archimedean or logarithmic spirals overlaid with slight differences in tightness, offset, or rotation. The interference creates *radial spokes* that appear to spin independently of the spiral rotation — one of the strongest motion illusions in moiré.

## Why It Hits Different

Spiral arms are already "moving" in your visual field (they wind outward). The moiré adds a *second, ghost rotation*. Your visual system tries to track both and fails, creating the sensation of counter-rotating phantom wheels.

## Mathematical Core

Archimedean spiral: `r = a + b * θ`
In shader terms: `phase = atan(y,x) + log(length(uv)) * spiralTightness`

Two spirals with slightly different `spiralTightness` values create interference along the radial direction. The beat frequency is in *angular* space, not Cartesian.

## The Phantom Rotation

When two spirals rotate at slightly different speeds:
- Spiral 1 rotates at ω₁
- Spiral 2 rotates at ω₂

The moiré spokes rotate at approximately (ω₁ - ω₂) / 2 — potentially *slower* than either spiral, or even *backward* if ω₁ and ω₂ are close.

This is the **wagon wheel effect** in spatial form.

## Spiral Types

| Type | Equation | Character |
|------|----------|-----------|
| Archimedean | `r = a * θ` | Even spacing, linear growth |
| Logarithmic | `r = a * e^(b*θ)` | Exponential growth, tighter at center |
| Hyperbolic | `r = a / θ` | Inverse growth, dense at center |
| Fermat | `r² = a² * θ` | Parabolic growth |

Each type produces different moiré "character." Archimedean = mechanical. Logarithmic = organic/nautilus. Hyperbolic = explosive/dense.
