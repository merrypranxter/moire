# Variations

## 1. Circular Kinegram
Use concentric rings instead of vertical strips. Rotation of the mask reveals successive frames. Creates *radial animation* — frames appear to emanate from center.

**Shader pivot:** Replace `uv.x` with `length(uv)` for radial strip indexing.

## 2. Multi-Direction Kinegram
Interlace in both X and Y directions. The mask is a 2D grid. Moving diagonally reveals frames in a 2D sequence — like a sprite sheet where motion direction selects the animation.

## 3. Depth Kinegram (Parallax)
Multiple layers at different strip widths. Moving the mask at different speeds reveals different depth layers. Creates *parallax* without 3D geometry — pure 2D moiré depth.

## 4. Audio-Driven Kinegram
The mask position is driven by audio amplitude or frequency. Bass hits advance the frame; silence holds it. The animation becomes *rhythmic*, synchronized to music.

## 5. Scroll-Triggered Kinegram
For web implementations: the user's scroll position drives the mask offset. The page "animates" as you scroll — text morphs, images transform, all through moiré frame selection.

## 6. Lenticular Alternative
Instead of a striped mask, use a lens array (lenticular sheet). Each lens focuses on a different strip angle. The viewer's *position* (not motion) selects the frame. More sophisticated than barrier grid but same moiré principle.
