# Principle: Contrast Push — Moiré is Subtle, Exaggerate the Peaks

## The Problem

Raw moiré is often *subtle*. The difference between fringe peaks and troughs may be only 10-20% of full range. Without contrast enhancement, the pattern is ghostly, washed-out, hard to see.

## The Solution

Aggressive tonal curve manipulation:
```glsl
moire = smoothstep(low, high, moire);
```

Where `low` and `high` are chosen to stretch the moiré range to full black-to-white:
- `low = 0.3` (crush shadows)
- `high = 0.7` (blow out highlights)

## Contrast Strategies

| Strategy | Effect |
|----------|--------|
| `smoothstep(0.3, 0.7, x)` | Standard S-curve, gentle |
| `smoothstep(0.4, 0.6, x)` | Hard S-curve, aggressive |
| `pow(x, 0.5)` | Gamma lift, brightens midtones |
| `pow(x, 2.0)` | Gamma crush, darkens midtones |
| `step(0.5, x)` | Binary threshold, stark |
| `sin(x * PI - PI/2) * 0.5 + 0.5` | Sine curve, smooth roll-off |

## The Aesthetic Choice

- **Low contrast:** Ethereal, ghostly, scientific
- **High contrast:** Bold, graphic, pop-art
- **Binary:** Digital, stark, op-art
- **S-curve:** Photographic, natural, "correct"

The contrast push is not a technical correction — it's an **aesthetic decision** about how the moiré should feel.

## The Compusophy Reading

> "Moiré is subtle; you need to exaggerate the peaks."

This is the moiré version of photographic development: the latent image is always there, but it needs chemical (or algorithmic) amplification to become visible. The artist is the developer, bringing the hidden pattern into the light.
