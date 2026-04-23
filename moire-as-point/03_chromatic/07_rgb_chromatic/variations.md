# Variations

## 1. CMYK Separation
Four grids (CMYK) at slightly different angles — exactly how halftone printing works, but *amplified* instead of suppressed.

The "registration error" that printers try to eliminate becomes the *entire aesthetic*. Beat frequencies between cyan and magenta create visible red fringes, etc.

**Shader pivot:** Add a fourth channel (or use CMY instead of RGB):
```glsl
vec4 cmyk;
cmyk.r = grid(...); // Cyan
cmyk.g = grid(...); // Magenta
cmyk.b = grid(...); // Yellow
cmyk.a = grid(...); // Key (Black)
```

## 2. HSV Moiré
Instead of RGB, use Hue-Saturation-Value:
```glsl
float hue = fract(gridH(uv, scaleH, offsetH));
float sat = gridS(uv, scaleS, offsetS);
float val = gridV(uv, scaleV, offsetV);
vec3 rgb = hsv2rgb(vec3(hue, sat, val));
```
The moiré controls *hue directly* — interference creates rainbow fringes that cycle through the spectrum.

## 3. Complementary Moiré
Use only two channels at complementary scales:
```glsl
float scale1 = 40.0;
float scale2 = 40.0 * sqrt(2.0); // irrational ratio
```
The moiré never repeats. The color interference is *aperiodic* — always fresh, never looping.

## 4. Temperature Moiré
Map moiré intensity to color temperature:
```glsl
float temp = mix(2000.0, 10000.0, moireIntensity); // Kelvin
vec3 color = blackbody(temp);
```
The moiré fringes go from warm (orange) to cool (blue) — like watching heat radiate.

## 5. Chromatic Aberration Moiré
Simulate lens chromatic aberration:
```glsl
vec2 offsetR = uv + vec2(0.01, 0.0); // Red shifted right
vec2 offsetB = uv - vec2(0.01, 0.0); // Blue shifted left
float r = grid(offsetR, scale, ...);
float b = grid(offsetB, scale, ...);
```
The moiré itself is *spatially separated by color* — like a prism splitting white light into interference rainbows.

## 6. Temporal Color Cycling
Drive hue rotation with time:
```glsl
float hueShift = iTime * 0.1;
vec3 rgb = hsv2rgb(vec3(fract(hue + hueShift), sat, val));
```
The moiré *breathes* through the color wheel — each fringe cycles independently based on its spatial position.
