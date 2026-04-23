# Variations

## 1. Flow Field Advection
Use a curl noise flow field to advect the grid:
```glsl
vec2 flow = curlNoise(uv * scale);
vec2 advectedUV = uv + flow * iTime;
float g = grid(advectedUV, scale, offset);
```
The grid *flows* like a fluid. The moiré shows the *streamlines* of the flow — interference patterns that follow the vector field.

## 2. Elastic Grid
Treat grid points as masses on springs:
```glsl
vec2 displacement = springForce(uv, neighbors) * damping;
```
The grid *oscillates* elastically. The moiré *bounces* — fringes compress and expand like a trampoline.

## 3. Reaction-Diffusion Grid
Use Gray-Scott or similar reaction-diffusion to perturb the grid:
```glsl
float perturbation = reactionDiffusion(uv, feed, kill);
```
The grid is eaten away by reaction-diffusion patterns. The moiré becomes *corroded* — interference in damaged material.

## 4. Fractal Perturbation
Use multi-octave noise with different frequencies for X and Y:
```glsl
vec2 perturbation = vec2(
    fbm(uv * vec2(1.0, 3.0)),
    fbm(uv * vec2(3.0, 1.0))
);
```
Anisotropic noise creates *directional* perturbation. The moiré has *grain* — like wood or muscle fiber.

## 5. Topological Perturbation
Add "defects" — singularities where the grid phase jumps:
```glsl
float phase = atan(uv.y - defect.y, uv.x - defect.x);
```
Creates *vortex-like* perturbations. The moiré develops *swirls* around each defect — like weather patterns around low-pressure systems.

## 6. Historical Perturbation
Accumulate perturbation over time:
```glsl
perturbation += noise(uv + perturbation) * 0.01;
```
The grid *remembers* its perturbations. The moiré becomes *historical* — each frame's interference contains traces of all previous perturbations.
