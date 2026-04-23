# Supermoiré (Moiré of Moiré) — Fractal Interference

## The Phenomenon

Three+ layers, each at different scales and speeds. Not just nested interference — *hierarchical* interference where the moiré of layers 1&2 beats against layer 3. The result is **fractal moiré**: small fast patterns inside large slow envelopes. The visual system can't resolve the hierarchy; it sees infinite regression.

## The Physics of Supermoiré

In condensed matter physics, "supermoiré" refers to twisted trilayer graphene — three stacked 2D materials with slightly different twist angles. The moiré of layers 1&2 creates a superlattice, and *that* superlattice interferes with layer 3.

The result: **fractal energy bands** — electronic states that repeat at multiple scales, with properties that depend on the *ratio* of twist angles. Some ratios create "magic" flat bands where electrons behave collectively.

## The Visual Equivalent

In shaders:
- Layer 1: Fine grid, fast drift → creates tight moiré
- Layer 2: Same grid, slightly faster drift → beats against Layer 1
- Layer 3: Coarser grid, slower drift → beats against the *moiré of 1&2*

The beat frequency of 1&2 is itself a grating that interferes with layer 3. This is **second-order moiré**.

## Fractal Hierarchy

With N layers, you get interference at N-1 levels:
- Level 1: Individual gratings
- Level 2: Pairwise moiré (N choose 2 combinations)
- Level 3: Moiré of moiré (N choose 3 combinations)
- ...
- Level N-1: The supermoiré

Each level has a different spatial scale and temporal frequency. The result is a **fractal spectrum** of interference.

## The Golden Ratio Stack

For maximum non-repetition, use scales related by the golden ratio φ:
- Layer 1: scale = 1.0
- Layer 2: scale = φ
- Layer 3: scale = φ²
- Layer 4: scale = φ³
- ...

Since φ is irrational, no two layers have a rational frequency ratio. The supermoiré never repeats — it's a **quasiperiodic fractal**.

## Prime Number Stack

Alternatively, use prime-numbered scales:
- Layer 1: 2
- Layer 2: 3
- Layer 3: 5
- Layer 4: 7
- Layer 5: 11

Prime ratios ensure no common sub-harmonics. The supermoiré is maximally "complex" — no simple repeating structure at any level.
