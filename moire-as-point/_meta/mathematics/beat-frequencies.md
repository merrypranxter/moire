# Beat Frequencies in Moiré

## The Acoustic Analogy

When two sound waves of slightly different frequencies overlap, you hear **beats** — periodic variations in amplitude at the difference frequency:
```
f_beat = |f1 - f2|
```

Moiré is the **visual equivalent** of acoustic beats. Two grids of slightly different spatial frequencies create visual beats — periodic variations in brightness at the spatial difference frequency.

## The Mathematics

Two sine gratings:
```
G1 = sin(2π * f1 * x)
G2 = sin(2π * f2 * x)
```

Their sum:
```
G1 + G2 = 2 * sin(π * (f1 + f2) * x) * cos(π * (f1 - f2) * x)
```

This is the **product of a high-frequency carrier** (`(f1+f2)/2`) and a **low-frequency envelope** (`(f1-f2)/2`).

The envelope is the moiré — it modulates the amplitude of the carrier, creating visible bands.

## The Envelope Function

The moiré envelope is:
```
envelope(x) = 2 * cos(π * (f1 - f2) * x)
```

This has:
- **Period:** `1 / |f1 - f2|` (the fringe spacing)
- **Amplitude:** 2 (twice the individual grating amplitude)
- **Phase:** determined by relative phase of G1 and G2

## Temporal Beats

When the gratings *move*:
```
G1 = sin(2π * f1 * (x - v1 * t))
G2 = sin(2π * f2 * (x - v2 * t))
```

The envelope becomes:
```
envelope(x,t) = 2 * cos(π * [(f1 - f2) * x - (f1*v1 - f2*v2) * t])
```

This has:
- **Spatial period:** `1 / |f1 - f2|`
- **Temporal period:** `1 / |f1*v1 - f2*v2|`
- **Velocity:** `(f1*v1 - f2*v2) / (f1 - f2)`

When `f1 ≈ f2`, the velocity is huge — the moiré moves much faster than either grid.

## Multiple Beat Frequencies

With three gratings, you get multiple beat frequencies:
- `|f1 - f2|` (primary moiré)
- `|f2 - f3|` (secondary moiré)
- `|f1 - f3|` (tertiary moiré)
- `|f1 - f2 - f3|` (supermoiré)

These beats can **interfere with each other**, creating complex patterns:
- When `|f1 - f2| ≈ |f2 - f3|`, the secondary and tertiary moiré beat against each other
- This creates a "beat of beats" — slow modulation of the moiré pattern itself

## The Heterodyne Principle

In radio engineering, a **heterodyne** mixes two frequencies to produce a difference frequency:
```
f_IF = |f_RF - f_LO|
```

Moiré is a **spatial heterodyne**. The "intermediate frequency" is the difference between two spatial frequencies, shifted down to a visible range.

This is why moiré can "demodulate" high-frequency patterns into low-frequency visible patterns — it's literally a spatial mixer.
