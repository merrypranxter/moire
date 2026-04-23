# Moiré Magnification (Pinhole Lens Effect) — Moiré as Lens

## The Phenomenon

One layer is a dense grid of *tiny pinholes* (or transparent dots). The other layer is any image. The moiré doesn't just make bands — it *samples and magnifies* the underlying image through the pinhole array. The image appears to float, magnified, in the interference space.

## How It Works

1. **Image layer:** A high-resolution image (or procedural texture)
2. **Pinhole mask:** A dense grid of small transparent holes on opaque background
3. **Overlap:** When the mask aligns with the image, each pinhole samples a tiny region
4. **Magnification:** The moiré beat frequency between the image pixel grid and the pinhole grid creates an *enlarged* version of the image

The magnification factor is:
```
M = f_image / |f_image - f_pinhole|
```

Where `f_image` is the image spatial frequency and `f_pinhole` is the pinhole grid frequency. When the frequencies are close, the magnification is *huge*.

## The Magic

You can "see" a high-res image through a low-res pinhole mask because the moiré acts as an optical amplifier. The magnified image is not physically present — it's an *emergent property* of the interference.

## Applications

- **Steganography:** Hide images in noise; only reveal through moiré magnification
- **Microscopy:** Moiré-based magnification without lenses
- **Security printing:** Hidden images visible only under specific grid overlays
- **Art:** The image is the "ghost" that haunts the interference

## The Lens Metaphor

A physical lens bends light to converge at a focal point. A moiré "lens" bends *spatial frequency* to converge at a magnified image. Both are information transformers — they take one spatial distribution and produce another.
