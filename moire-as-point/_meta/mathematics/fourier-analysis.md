# Fourier Analysis of Moiré

## The Mathematical Foundation

Moiré is fundamentally a **Fourier phenomenon**. Any periodic pattern can be decomposed into sine waves, and moiré is the interference between these decomposed components.

## The Fourier Transform

For a 2D pattern `f(x,y)`, the Fourier transform is:
```
F(u,v) = ∫∫ f(x,y) * e^(-2πi(ux + vy)) dx dy
```

This decomposes the pattern into spatial frequencies `(u,v)` with amplitudes `|F(u,v)|`.

## Grating Decomposition

A single grid (square lattice) decomposes into:
- Fundamental frequency: `(f, 0)` and `(0, f)`
- Harmonics: `(2f, 0)`, `(0, 2f)`, `(f, f)`, etc.

In frequency space, the grid is a set of delta functions (points) at these harmonic locations.

## Moiré in Frequency Space

When two grids overlap:
- Grid A has frequencies at `±(f1, 0)`, `±(0, f1)`, etc.
- Grid B has frequencies at `±(f2, 0)`, `±(0, f2)`, etc.

The product (multiplication) in spatial domain becomes **convolution** in frequency domain:
```
F_moire = F_A * F_B (convolution)
```

This creates new frequency components at:
- `f1 + f2` (sum frequencies — usually too high to see)
- `f1 - f2` (difference frequencies — the visible moiré)
- `2f1 - f2`, `f1 - 2f2`, etc. (higher-order moiré)

## The Difference Frequency

The visible moiré is at `|f1 - f2|`. When `f1 ≈ f2`:
- The difference frequency is *low*
- The corresponding spatial wavelength is *long*
- The pattern is *large-scale* and *slow-moving*

This is why tiny differences in grid spacing create huge moiré patterns.

## Higher-Order Moiré

When three+ grids overlap, the convolution creates higher-order terms:
- `|f1 - f2 - f3|` (second-order moiré)
- `|2f1 - f2|` (harmonic moiré)
- `|f1 + f2 - f3|` (mixed-order moiré)

These are the "supermoiré" patterns — fractal interference at multiple scales.

## The Sampling Theorem Connection

Moiré is closely related to **aliasing** in signal processing:
- Sampling a signal at frequency `fs` creates aliases at `f ± n*fs`
- Moiré is the spatial equivalent: sampling a grid at another grid's frequency

The Nyquist limit (`fs > 2*f_max`) is the condition for avoiding moiré — which is exactly why moiré artists *violate* it intentionally.

## Practical Implications

1. **Predict moiré before rendering:** Calculate difference frequencies to know where moiré will appear
2. **Control moiré scale:** Set `|f1 - f2|` to target a specific fringe size
3. **Eliminate unwanted moiré:** Ensure frequency ratios are irrational (no common sub-harmonics)
4. **Create supermoiré:** Stack frequencies with specific harmonic relationships
