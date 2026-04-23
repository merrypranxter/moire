# Kinegram / Barrier Grid Animation — Moiré as Cinema

## The Phenomenon

Not drift — *frame animation*. A static image sliced into vertical strips, overlaid with a striped mask (the "barrier"). Moving the mask reveals successive frames of animation. The "interference" is between the image frequency and the mask frequency — *temporal* moiré, not spatial.

## How It Works

1. **Interlaced image:** N frames of animation are sliced into strips and interlaced:
   ```
   Frame 0: strips 0, N, 2N, 3N...
   Frame 1: strips 1, N+1, 2N+1...
   Frame 2: strips 2, N+2, 2N+2...
   ```

2. **Barrier mask:** A striped mask with opaque/transparent strips at the same pitch as the interlaced strips.

3. **Relative motion:** Moving the mask by one strip width reveals the next frame.

The moiré is the *beat* between the image strip frequency and the mask strip frequency. When they align, one frame is visible. When they misalign by 1/N, the next frame is visible.

## Key Parameters

| Parameter | Effect |
|-----------|--------|
| Strip count (N) | Number of animation frames. Higher N = smoother animation but lower resolution per frame |
| Strip width | Controls visibility — too narrow and light loss is severe |
| Mask opacity | Full opacity = crisp frames; partial opacity = motion blur/ghosting |
| Motion speed | Faster motion = shorter frame visibility; can create strobing |

## The Magic

The image is *static*. The mask is *static* (or moving). But the *combination* produces animation. This is moiré as **temporal information carrier** — the interference pattern encodes time.

## Physical vs Digital

**Physical kinegrams:** Printed on paper/cardboard. Viewer moves the mask (or tilts the card) to see animation. Used in books, packaging, advertising.

**Digital kinegrams:** Shader-based. The "mask" is a mathematical function. The "motion" can be driven by mouse, scroll, time, or audio.

**Installation kinegrams:** Building-scale. The building facade is the interlaced image; the viewer's motion (walking, driving) is the mask movement. The building "animates" as you pass. [^7^]
