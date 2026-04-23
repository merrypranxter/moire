# Variations

## 1. Elliptical Rings
Replace `length(uv)` with elliptical distance:
```glsl
float r = length(vec2(uv.x * aspect, uv.y));
```
Creates moiré that stretches/compresses along one axis. Multiple ellipses at different angles create *interference of anisotropies*.

## 2. Spiral-Ring Hybrid
Add angular component to rings:
```glsl
float phase = r * ringFreq + atan(uv.y, uv.x) * spiralAmount;
```
Creates rings that "wind" — the moiré becomes spiral-like interference within circular structure.

## 3. Multi-Center Polyphony
3+ ring systems, each with different center. The moiré becomes *polyphonic* — interference patterns from multiple sources overlapping. Creates complex "cellular" regions where different beat frequencies compete.

## 4. Frequency Chirp (Radial)
Make ring frequency increase with radius:
```glsl
float freq = baseFreq + r * chirpRate;
```
Moiré fringes get tighter toward edges — like a Doppler shift in visual space.

## 5. Phase Dislocation
Introduce a "defect" in the phase:
```glsl
float phase = r * freq + (length(uv - defectCenter) < defectRadius ? PI : 0.0);
```
Creates a "dislocation" in the moiré — the fringes bend around an invisible obstacle. Ties to topological defects in crystal lattices.
