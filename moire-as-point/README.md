# moire-as-point

## The Philosophy

> "The visible world is the beat between invisible worlds."

This repository is a **taxonomy of moiré techniques** — not as artifacts to be suppressed, but as content to be amplified. The grids are the ontology; the moiré is the phenomenology. This is a collection of emergence.

## What This Is

- **21 technique families** covering spatial, temporal, chromatic, geometric, aperiodic, organic, and hybrid approaches (numbered up to 26 — gaps are reserved for upcoming families)
- **Principles** that unify all techniques
- **Mathematics** that explain why moiré works
- **References** to artists, scientists, and historical precedents
- **Generative workflows** for choosing a family and mapping mood to structure
- **Shader code** for every technique, ready to run in Shadertoy or GLSL environments

## What This Is Not

- Not a "moiré removal" guide (there are plenty of those)
- Not a single "cool effect" — it's a systematic exploration
- Not finished — moiré is infinite; this is a snapshot

## Repo Structure

```
moire-as-point/
├── 01_foundations/           # The basic moiré families
│   ├── 01_square_lattice/    # The archetype — your compusophy piece lives here
│   ├── 02_radial_rings/      # Concentric interference
│   ├── 03_spiral_phantoms/   # Rotating phantom wheels
│   └── 04_wave_sinusoidal/   # Soft, liquid interference
├── 02_temporal_kinetic/      # Time-based moiré
│   ├── 05_kinegram_cinema/   # Moiré as frame animation
│   └── 06_temporal_feedback/ # Moiré as memory
├── 03_chromatic/             # Color moiré
│   ├── 07_rgb_chromatic/     # Interferential color mixing
│   └── 08_cmyk_separation/  # The print ghost
├── 04_geometric_topological/ # 3D and observer-dependent
│   ├── 09_projection_3d/     # Moiré as scanner/contours
│   └── 10_anamorphic_secret/ # Moiré that only resolves from one viewpoint
├── 05_aperiodic/             # Never-repeating moiré
│   ├── 11_penrose_quasiperiodic/ # Golden ratio, 5-fold symmetry
│   └── 12_supermoire_fractal/    # Moiré of moiré — fractal interference
├── 06_organic/               # Irregular, biological moiré
│   ├── 13_voronoi_cellular/  # Moiré of irregular tessellations
│   ├── 14_perturbed_grids/   # Moiré with imperfection
│   └── 21_field_distorted_moire/ # Vector fields warp the grids — moiré as weather
├── 07_hybrid_meta/           # Cross-domain moiré
│   ├── 15_magnification_lens/ # Moiré as optical amplifier
│   ├── 16_audio_reactive/    # Sound made visible
│   ├── 17_data_interference/ # Moiré as data visualization
│   ├── 18_multiplexed_layers/ # Three+ grids stacked — cathedral interference
│   ├── 23_typographic_semantic_moire/ # Glyph fields against glyph fields
│   └── 26_failure_specters/  # Glitch, clipping, aliasing as content
└── _meta/
    ├── principles/           # Core principles that unify all techniques
    ├── mathematics/          # Fourier, beats, quasiperiodic math, sampling, phase
    ├── generative_workflows/ # How to choose a family; mood → structure map
    └── references/           # Artists, papers, history
```

## Each Technique Folder Contains

- `principle.md` — The concept, why it works, the compusophy reading
- `shader.glsl` — Ready-to-run GLSL code (Shadertoy compatible)
- `variations.md` — 3-6 remix directions to push the technique further
- `references.md` — Artists, scientists, and historical anchors

> Newer families (18, 21, 23, 26) currently ship with concept-level `principle.md`
> stubs and placeholder `shader.glsl` files; their `variations.md` and
> `references.md` are scaffolds waiting to be filled in.

## The Ten Core Principles

1. **Moiré as content, not artifact** — Don't clean it up, amplify it
2. **Relative motion > absolute motion** — The pattern moves more than the source
3. **Scale differential controls fringe size** — Tiny differences = huge emergent patterns
4. **Sub-pixel precision** — The smoothness requires floating-point offsets
5. **Contrast push** — Moiré is subtle; you need to exaggerate the peaks
6. **Phase is character** — Frequency picks the beat; phase picks the personality
7. **Moiré is a difference amplifier** — Tiny structural disagreements become visible structures
8. **Interference creates false objects** — The pattern is in neither layer; it lives in their relationship
9. **Legibility lives at the threshold** — The sweet spot is near collapse
10. **Moiré is compression leakage** — It is the residue of sampling and quantization

## How to Use This Repo

### For Learning
Start with `01_square_lattice` (the archetype) and read through the principles. Each technique builds on the previous.

### For Making
Pick a technique that matches your aesthetic goal, grab the shader, and start tweaking parameters. The variations.md files are your remix guide.

### For Research
The `_meta/mathematics` and `_meta/references` sections provide the theoretical foundation. Follow the scientific papers for deep dives.

### For Generating
The `_meta/generative_workflows` section helps you pick a moiré family and map an emotional or conceptual mood to a concrete structure.

### For Teaching
Each principle.md is written to be accessible but rigorous. Use them as lecture material or workshop handouts.

## The Meta-Principle

> This repo isn't a collection of effects — it's a taxonomy of emergence.

Every technique shares the same core insight: **reality isn't the things — it's the relationships between things.** The grids are the code. The moiré is the runtime. You're watching computation made visible.

## License

This is knowledge, not property. Use it, remix it, teach it, sell it. The moiré belongs to everyone.

## Contributing

Found a new moiré technique? Discovered a historical reference we missed? Want to add a shader implementation in another language? Open an issue or PR. The taxonomy grows.

---

*"The Universe is a Difference Engine"*
