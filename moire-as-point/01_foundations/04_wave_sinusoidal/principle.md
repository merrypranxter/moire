# Wave / Sinusoidal Moiré — Soft Interference

## The Phenomenon

Instead of binary dots or lines, use continuous sine-wave gratings. Two overlaid sinusoidal patterns with slightly different frequencies, phases, or orientations. The interference creates smooth, liquid fringes rather than sharp digital bands.

## Why It Hits Different

Binary moiré is sharp, aliased, digital. Sinusoidal moiré is smooth, analog, *liquid*. The fringes are gradients, not bands. The interference feels organic — more like water ripples, less like wire mesh.

## Mathematical Core

Grating: `G(x) = 0.5 + 0.5 * sin(2π * f * x + φ)`

Two gratings:
- `G1 = 0.5 + 0.5 * sin(2π * f1 * x + φ1)`
- `G2 = 0.5 + 0.5 * sin(2π * f2 * x + φ2)`

When multiplied (not added):
```
G1 * G2 = 0.25 + 0.25*sin(2πf1x + φ1) + 0.25*sin(2πf2x + φ2) 
          + 0.125*cos(2π(f1-f2)x + (φ1-φ2)) - 0.125*cos(2π(f1+f2)x + (φ1+φ2))
```

The `(f1 - f2)` term is the moiré — a low-frequency cosine wave riding on a DC offset. The sum frequency `(f1 + f2)` is usually too high to resolve.

## Blending Modes

| Mode | Effect |
|------|--------|
| Additive (`G1 + G2`) | Bright fringes where both peaks align |
| Multiplicative (`G1 * G2`) | Natural interference — contains difference frequency directly |
| Maximum (`max(G1, G2)`) | Harder edges, more contrast |
| Difference (`abs(G1 - G2)`) | Fringe lines at zero-crossings |
| XOR-like (`mod(G1 + G2, 1.0)`) | Wraparound artifacts, digital feel |

Multiplicative blending is the "physically correct" mode for wave interference.

## The Liquid Quality

Because sine waves have no hard edges, the moiré fringes *blend* into each other. There's no sharp boundary between fringe and void — just a continuous breathing gradient. This creates:
- **Hypnotic depth:** The eye can't fixate on any edge
- **Organic feel:** Resembles natural phenomena (water, sound, heat)
- **Temporal smoothness:** Sub-pixel motion is inherently smooth — no stepping
