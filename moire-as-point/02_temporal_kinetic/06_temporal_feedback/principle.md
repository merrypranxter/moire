# Temporal Feedback Moiré — Moiré as Memory

## The Phenomenon

Not just spatial layers — *temporal* layers. Each frame renders a grid, but the grid from N frames ago is mixed in via feedback buffer. The moiré is the interference between *now* and *then* — time made visible through spatial beats.

## How It Works

1. **Current frame:** Render grid at time `t` with parameters `P(t)`
2. **Feedback buffer:** Contains the rendered output from frame `t-1`
3. **Mix:** `output = mix(grid(t), feedback(t-1), decay)`
4. **Store:** Write `output` back to feedback buffer for next frame

The `decay` parameter (typically 0.90–0.99) controls how long traces persist. High decay = long ghost trails. Low decay = short memory.

## What Emerges

- **Ghost fringes:** The moiré from previous frames lingers, creating "echo" patterns
- **Temporal beats:** When grid parameters oscillate, the feedback creates beats between the oscillation period and the persistence time
- **Accumulative resonance:** Certain parameter combinations cause the feedback to *amplify* rather than decay — emergent oscillations
- **Memory textures:** The buffer becomes a palimpsest — overwritten but never fully erased

## The Memory Metaphor

This technique literalizes the idea that **perception is temporal**. We don't see "now" — we see a weighted average of recent nows. The feedback buffer is a model of visual persistence, iconic memory, the "specious present."

## Feedback as Filter

Mathematically, feedback is a **first-order low-pass filter** in time:
```
output(t) = α * grid(t) + (1-α) * output(t-1)
```
Where `α = 1 - decay`.

This creates an exponential moving average. The "impulse response" is an exponential decay — each frame's contribution fades as `e^(-t/τ)` where `τ` is the time constant.

## Instability & Resonance

When the grid oscillation frequency matches the feedback decay rate, you get **resonance**:
- The feedback reinforces the oscillation
- Amplitude grows until limited by saturation
- Creates self-sustaining moiré "modes"

This is the visual analogue of a **laser cavity** — feedback amplifies specific frequencies.
