# Principle: Sub-Pixel Precision for Smoothness

## The Requirement

For smooth, liquid moiré animation, grid offsets must use **floating-point precision** — not integer jumps. Integer-pixel offsets create stepping artifacts; fractional offsets create continuous motion.

## The Mathematics

Grid function: `g(x) = sin(2π * f * (x + offset))`

With integer offset:
- `offset = 0, 1, 2, 3...` → grid jumps by full periods
- The moiré "snaps" between discrete states
- Motion is staccato, not legato

With fractional offset:
- `offset = 0.0, 0.01, 0.02, 0.03...` → grid shifts by tiny amounts
- The moiré flows continuously
- Motion is smooth, hypnotic

## The Implementation

In GLSL, this is automatic — `float` precision is the default. But in CPU-based or pixel-art implementations, you must explicitly use sub-pixel coordinates.

## The Visual Difference

| Integer Offset | Fractional Offset |
|----------------|-------------------|
| Stepped, digital | Smooth, analog |
| Strobing motion | Flowing motion |
| Discrete states | Continuous field |
| Glitch aesthetic | Liquid aesthetic |

Both are valid aesthetics — but they are *different* aesthetics. Choose intentionally.

## The Compusophy Reading

> "The smoothness requires floating-point offsets."

This is the moiré version of Zeno's paradox: between any two states, there are infinite intermediate states. The moiré exists in the continuum, not the discrete.
