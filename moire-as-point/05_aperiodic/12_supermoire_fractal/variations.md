# Variations

## 1. Prime Stack
Use prime-numbered scales (2, 3, 5, 7, 11, 13...). No common factors = no repeating substructure at any level. The supermoiré is maximally aperiodic.

## 2. Fibonacci Stack
Use Fibonacci numbers as scales: 1, 1, 2, 3, 5, 8, 13... The ratio of consecutive Fibonacci numbers approaches φ, so this converges to the golden ratio stack but with integer-friendly values.

## 3. Logarithmic Stack
Use scales that increase exponentially:
```glsl
float scale = base * pow(growthRate, float(layer));
```
With `growthRate = 2.0`, each layer is twice the scale of the previous. The supermoiré has octave-like harmonic relationships.

## 4. Self-Similar Supermoiré
Make each layer's moiré *feed back* into the next layer's parameters:
```glsl
float scale3 = baseScale * (1.0 + m12 * feedbackStrength);
```
The supermoiré *modulates itself* — a self-referential fractal.

## 5. Temporal Supermoiré
Each layer has a different temporal frequency, and the frequencies themselves are in irrational ratios:
```glsl
float speed1 = 0.1;
float speed2 = 0.1 * phi;
float speed3 = 0.1 * phi * phi;
```
The temporal beats create *temporal fractals* — patterns within patterns in time, not just space.

## 6. 3D Supermoiré
Add a third spatial dimension (depth). Each layer is at a different Z position, and the projection creates additional interference. The supermoiré becomes *volumetric*.
