# Perturbed / Organic Grids — Moiré with Imperfection

## The Phenomenon

Start with a regular grid, then perturb it — add noise, displacement, warping. The moiré that emerges is *organic* — not the clean bands of perfect grids, but wobbly, breathing, living interference. The imperfection becomes the character.

## Why Perturbation Changes Everything

A perfect grid creates perfect moiré: straight bands, regular spacing, predictable motion. A perturbed grid creates *imperfect* moiré:
- Bands that *curve* and *split*
- Fringes that *breathe* in width
- Patterns that *nucleate* and *dissolve*
- Interference that *flows* like liquid

The perturbation introduces *local* variation into the global beat frequency. The moiré becomes a *field* rather than a *pattern*.

## Types of Perturbation

| Type | Method | Effect |
|------|--------|--------|
| Noise displacement | `uv += noise(uv)` | Wobbly, turbulent moiré |
| Sine warping | `uv += sin(uv * freq) * amp` | Undulating, wave-like moiré |
| Domain warping | `uv = f(uv)` | Folded, recursive moiré |
| Fractal perturbation | `uv += fbm(uv)` | Self-similar irregular moiré |
| Flow field | `uv += flow(uv)` * time | Advected, streaming moiré |
| Elastic deformation | `uv += spring(uv)` | Bouncing, oscillating moiré |

## The Noise-Moiré Relationship

The amount of perturbation relative to grid spacing controls the moiré character:
- **Perturbation << spacing:** Almost perfect moiré, with slight waviness
- **Perturbation ≈ spacing:** Complex, cellular moiré — bands break into patches
- **Perturbation >> spacing:** The grid is destroyed; no moiré, just noise

The "sweet spot" is where perturbation is ~10-30% of grid spacing. The moiré is *recognizable but alive*.

## Domain Warping

A powerful technique: use the grid value itself to perturb the UV coordinates *before* sampling:
```glsl
vec2 warpedUV = uv + sin(grid(uv) * 10.0) * 0.1;
float moire = grid(warpedUV, scale, offset);
```

This creates *feedback* — the grid warps itself. The moiré becomes recursive, self-referential, potentially chaotic.
