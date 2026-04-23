# Variations

## 1. Registration Drift Animation
Animate the *angles* themselves over time. The rosette pattern morphs continuously — at some moments it's a clear flower, at others it dissolves into noise. The "registration" is never stable.

## 2. Spot Color Moiré
Instead of CMYK, use Pantone spot colors or arbitrary hues. The interference creates colors that don't exist in either channel alone — emergent hues from spatial beats.

## 3. Duotone Moiré
Only two channels (e.g., Cyan and Black). The moiré is simpler but more stark. Creates high-contrast interference with limited palette — like a woodcut or linocut.

## 4. Stochastic/FM Screening
Instead of ordered dots, use random (stochastic) dot placement. The moiré becomes *grainy* rather than banded — like film grain interference. No visible rosette, but subtle texture beats.

## 5. Overprint Simulation
Simulate how ink actually behaves when overprinted:
```glsl
// Multiply blending (ink on ink)
float c_over_m = c * m; // Cyan over Magenta = darker
```
The moiré accounts for physical ink behavior, not just mathematical ideal.

## 6. Vintage Print Degradation
Add "defects" that real printing has:
- Dot gain (dots bleed into each other)
- Registration error (channels misaligned by constant offset)
- Paper texture (noise modulates dot visibility)
- Ink starvation (some dots don't print)

The moiré becomes *historical* — it looks like a found print, not a digital simulation.
