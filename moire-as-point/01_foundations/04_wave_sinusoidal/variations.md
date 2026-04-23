# Variations

## 1. Multi-Orientation Star Moiré
6+ sine gratings at angles `k * π/6` for `k = 0..5`. The interference creates *hexagonal* moiré zones — a kind of "star of David" pattern that emerges from the 6-fold symmetry.

## 2. Frequency Sweep (Chirp)
Make frequency vary across space:
```glsl
float freq = baseFreq + uv.x * sweepRate;
```
The moiré fringes *taper* — like a visual Doppler shift. Creates perspective-like depth without 3D geometry.

## 3. Phase Vortex
Add a vortex phase singularity:
```glsl
float phase = atan(uv.y, uv.x) * vortexStrength;
```
The sine waves wind around a center point. The moiré becomes *spiral interference* — smooth version of Technique 03.

## 4. Temporal Beats
Use audio frequencies or LFOs to drive the gratings. When two gratings are close in frequency (e.g., 440Hz and 442Hz visualized), the moiré *pulses* at the beat frequency (2Hz). Direct visualization of acoustic beats.

## 5. Complex Exponential
Use `exp(i * phase)` instead of `sin(phase)`. The real part is cosine, imaginary is sine. Combine as complex multiplication:
```glsl
vec2 g1 = vec2(cos(phase1), sin(phase1));
vec2 g2 = vec2(cos(phase2), sin(phase2));
vec2 moire = complexMul(g1, g2);
```
Creates *quadrature* moiré with phase information preserved.

## 6. Gaussian-Windowed Sine
Multiply sine grating by Gaussian envelope:
```glsl
float envelope = exp(-length(uv - center) * width);
float g = envelope * sineGrating(...);
```
Creates *localized* moiré — interference that only exists in a region, like a wave packet in quantum mechanics.
