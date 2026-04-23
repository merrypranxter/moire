# Variations

## 1. Variable Magnification
Change the pinhole scale across the image:
```glsl
float pinholeScale = 30.0 + uv.x * 10.0;
```
The magnification *varies* — some regions show enlarged detail, others show the raw image. Creates a "zoom" effect without actual zooming.

## 2. Multi-Image Moiré
Use multiple pinhole grids, each tuned to a different image frequency:
```glsl
float mask1 = pinholeMask(uv, 30.0, offset1); // Magnifies image A
float mask2 = pinholeMask(uv, 40.0, offset2); // Magnifies image B
```
Different moiré magnifications reveal different hidden images. The same surface contains multiple secrets.

## 3. Animated Magnification
Animate the pinhole scale over time:
```glsl
float pinholeScale = 30.0 + sin(iTime) * 5.0;
```
The magnification *breathes* — the hidden image grows and shrinks through moiré beats. Like a lens with variable focal length.

## 4. Chromatic Magnification
Different pinhole scales for RGB channels:
```glsl
float maskR = pinholeMask(uv, 30.0, offset);
float maskG = pinholeMask(uv, 30.2, offset);
float maskB = pinholeMask(uv, 30.4, offset);
```
Each channel magnifies the image differently. The result is *chromatic aberration* through moiré — color fringing that reveals the hidden structure.

## 5. Moiré Microscope
Use a *moving* pinhole mask (like a scanning microscope). The moiré magnification "scans" across the image, revealing detail sequentially. The viewer's eye tracks the moving detail.

## 6. Encrypted Moiré
The pinhole mask is generated from a cryptographic hash:
```glsl
vec2 maskOffset = hash(secretKey + uv);
```
Only someone with the secret key can generate the correct mask to reveal the hidden image. Moiré as encryption.
