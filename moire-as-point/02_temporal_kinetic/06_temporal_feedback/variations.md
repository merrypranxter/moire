# Variations

## 1. Multi-Tap Feedback
Instead of single-frame feedback, sample from N frames ago:
```glsl
vec3 old = texture(iChannel0, texUV, 2.0).rgb; // 2 frames ago
vec3 older = texture(iChannel0, texUV, 4.0).rgb; // 4 frames ago
```
Creates "rhythmic" ghosting — echoes at specific intervals like a delay pedal.

## 2. Spatial Feedback (Diffusion)
Blur the feedback buffer before mixing:
```glsl
vec3 blurred = blur(iChannel0, texUV, 2.0);
moire = mix(current, blurred, decay);
```
The moiré *spreads* over time — like ink diffusing in water. Creates organic, smoky interference.

## 3. Non-Linear Feedback
Use non-linear mixing functions:
```glsl
// Multiplicative feedback
moire = current * feedback;

// Threshold feedback
moire = current > 0.5 ? mix(current, feedback, decay) : current;

// Power feedback
moire = pow(mix(current, feedback, decay), 2.0);
```
Each creates different "memory personalities" — some remember highlights, others shadows.

## 4. Feedback with Color Shift
Rotate hue in feedback buffer:
```glsl
vec3 hsv = rgb2hsv(feedback);
hsv.x = fract(hsv.x + 0.01); // rotate hue
vec3 shifted = hsv2rgb(hsv);
moire = mix(current, shifted, decay);
```
The moiré *changes color* as it ages — like memory fading into different emotional tones.

## 5. Conditional Feedback
Only feedback under certain conditions:
```glsl
float condition = sin(iTime) > 0.0 ? 1.0 : 0.0;
moire = mix(current, feedback, decay * condition);
```
Creates "strobed" memory — the moiré only persists half the time, creating flickering echoes.

## 6. Feedback-Driven Parameter Modulation
Use the feedback value to control the current grid:
```glsl
float feedbackScale = 30.0 + feedback * 20.0;
float current = grid(uv, feedbackScale, offset);
```
The moiré *modifies itself* — a self-referential system where past output determines future input. Can lead to chaotic or emergent stable patterns.
