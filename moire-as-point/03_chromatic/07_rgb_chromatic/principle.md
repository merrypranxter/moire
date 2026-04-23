# Chromatic RGB Moiré — Moiré as Color Theory

## The Phenomenon

Separate RGB channels into slightly different grids — different scales, different offsets, different rotations. The interference fringes are *colored*. Where red and blue grids align → magenta fringes. Where they beat against green → yellow. The moiré becomes a *chromatic difference engine*.

## Why It's Not Just "Colorful Moiré"

This isn't "make the moiré pretty with color." This is **interferential color mixing** — colors emerge from spatial frequency relationships, not pigment or light addition.

In standard RGB mixing:
- Red + Green = Yellow (additive)
- Red + Blue = Magenta
- Green + Blue = Cyan

In chromatic moiré:
- Red fringe + Green fringe = Yellow *fringe* (spatial beat)
- The color is a *property of the interference region*, not a mixed light value

## The Channel Separation Principle

Each channel is an independent moiré system:
- Red: `gridR(uv, scaleR, offsetR)`
- Green: `gridG(uv, scaleG, offsetG)`
- Blue: `gridB(uv, scaleB, offsetB)`

When `scaleR ≈ scaleG ≈ scaleB`, the channels interfere *with each other* in color space. The moiré fringes of different colors overlap, creating:
- **White fringes:** Where all three align
- **Complementary fringes:** Where two align and one is absent
- **Chromatic beats:** Where the difference frequencies create slow color cycling

## Scale Differential as Color Shift

When scales differ between channels:
- `scaleR = 40.0`
- `scaleG = 40.2`
- `scaleB = 40.4`

The moiré fringes for each channel are at *different sizes*. The color "mixing" becomes spatially varying — some regions are red-dominant, others blue-dominant, depending on which channel's moiré is peaking.

## Temporal Chromatic Beats

When offsets animate at different speeds per channel:
- `offsetR` moves at 0.1 Hz
- `offsetG` moves at 0.12 Hz
- `offsetB` moves at 0.15 Hz

The *color* of the moiré fringes changes over time. You get **chromatic interference beats** — the visual equivalent of a Shepard tone, but for color.
