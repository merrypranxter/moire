# Variations

## 1. Multi-Arm Counter-Rotation
Use different `arms` counts for each spiral. The moiré creates *heterodyning* between angular frequencies — spokes that appear and disappear as different harmonic relationships come in and out of phase.

## 2. Logarithmic vs Archimedean
Overlay a logarithmic spiral on an Archimedean spiral. The scale-invariance of the logarithmic spiral creates moiré that is *self-similar* at all zoom levels — fractal interference.

## 3. Spiral Kinegram
Instead of continuous rotation, use discrete angular offsets. Each offset reveals a different "frame" of the moiré. Animate through offsets to create *spiral cinema* — the moiré spokes appear to walk around the center.

## 4. Radial Modulation
Modulate spiral tightness based on radius:
```glsl
float tightness = baseTightness + sin(r * 10.0) * 0.5;
```
Creates spirals that "wobble" — the moiré becomes unstable, constantly shifting between different interference regimes.

## 5. Broken Symmetry
Introduce a "cut" in the spiral — a region where the phase jumps by π. The moiré develops a *dislocation line* (topological defect) that persists regardless of rotation speed. Ties to crystal defects and vortices.

## 6. Color Spiral
Each spiral arm gets a different hue. The moiré interference creates *chromatic beats* — regions where color mixing happens through spatial interference rather than optical blending.
