# Variations

## 1. Hexagonal Lattice
Replace square grid with hexagonal packing. Changes interference symmetry from 4-fold to 6-fold. Creates triangular/diamond moiré zones instead of rectangular bands.

**Shader pivot:** Use hexagonal coordinate system:
```glsl
vec2 hex = vec2(uv.x * 1.1547, uv.y + uv.x * 0.57735);
```

## 2. Multiplicative Blending
Instead of `g1 + g2 + g3`, use `g1 * g2 * g3`. Creates *dark* fringes where all align — inverse moiré. More subtle, ghostly.

## 3. Thresholded Binary
Push contrast to extreme: `step(0.5, moire)`. Creates stark black/white bands with no gradation. More aggressive, digital aesthetic.

## 4. Rotating Grids
Add `rotation` parameter to each layer:
```glsl
mat2 rot = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
uv = rot * uv;
```
Different rotation speeds create *shearing* moiré that continuously morphs between band orientations.

## 5. Scale Chirp
Make scale vary across UV space: `scale = 40.0 + 10.0 * uv.y`. The moiré fringes *taper* — wider at top, tighter at bottom. Creates perspective-like depth.

## 6. Feedback Accumulation
Mix current frame with previous frame:
```glsl
vec3 prev = texture(iChannel0, fragCoord / iResolution.xy).rgb;
moire = mix(moire, prev, 0.9);
```
Creates trailing ghost fringes — temporal moiré (see Technique 06).
