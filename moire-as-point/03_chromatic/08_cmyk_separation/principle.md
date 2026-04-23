# CMYK Separation Moiré — The Print Ghost

## The Phenomenon

Four grids (Cyan, Magenta, Yellow, Black) at the classic halftone angles — C at 15°, M at 75°, Y at 0°, K at 45°. But instead of suppressing the moiré (as printers do), we *amplify* it. The "registration error" that destroys print quality becomes the entire aesthetic.

## The Halftone Angle System

Traditional 4-color printing uses specific angles to minimize moiré:
- Cyan: 15°
- Magenta: 75° (60° from Cyan)
- Yellow: 0° (15° from Cyan)
- Black: 45° (30° from Cyan)

These angles are chosen so that the beat frequencies between any two channels are high enough to be invisible to the eye at normal viewing distance.

## Weaponizing the Registration Error

In CMYK moiré, we:
1. **Misalign the angles** — push them closer together so beat frequencies drop into visible range
2. **Vary the screen frequencies** — make each channel a different LPI (lines per inch)
3. **Animate the registration** — drift the channels relative to each other in real-time
4. **Exaggerate the rosette** — the "flower" pattern that emerges from 4-color dot overlap becomes the primary visual

## The Rosette Pattern

When four halftone screens overlap at their ideal angles, they create a *rosette* — a small circular pattern of dots that repeats across the print. In CMYK moiré:
- The rosette is *enlarged* by scale differentials
- The rosette *animates* as channels drift
- The rosette *mutates* as angles change

## Color Beats

The interference between channels creates *color beats*:
- Cyan + Magenta alignment → Blue fringes
- Magenta + Yellow alignment → Red fringes
- Cyan + Yellow alignment → Green fringes
- All four align → Black/white fringes

These aren't mixed colors — they're *interference colors*, emerging from spatial relationships.
