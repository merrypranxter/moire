# Radial / Concentric Ring Moiré

## The Circular Analogue

Replace square grids with concentric circles or ellipses. Two sets of rings with slightly different spacing or center offset. The interference becomes radial bands that appear to breathe, expand, or rotate even when the rings themselves only drift microscopically.

## Why It Works

The same beat-frequency principle applies, but now in radial coordinates. The gratings are functions of `r = length(uv - center)` instead of `x` and `y` separately.

Given:
- Ring 1: `sin(2π * f1 * r)`
- Ring 2: `sin(2π * f2 * r)`

The difference frequency creates *annular* moiré bands — concentric interference rings that move radially.

## Key Differences from Square Lattice

| Aspect | Square | Radial |
|--------|--------|--------|
| Symmetry | 4-fold (90°) | Infinite rotational |
| Fringe shape | Straight bands / checkerboards | Concentric rings |
| Motion feel | Sweeping / shearing | Breathing / pulsing |
| Center effect | Uniform everywhere | Strongest at center, weaker at edges |
| Scale behavior | Linear scale diff | Radial scale diff (rings get tighter outward) |

## The Center Singularity

At `r = 0`, all rings converge. This creates a *singularity* in the moiré — the interference is maximally dense at center, creating a "bullseye" effect that can be hypnotic or nauseating depending on parameters.

## Emergent Behavior

- **Breathing:** Slow radial offset makes rings appear to expand/contract
- **Rotation:** Offset between centers creates rotating interference "propeller"
- **Elliptical distortion:** Non-circular rings create moiré that "wobbles"
