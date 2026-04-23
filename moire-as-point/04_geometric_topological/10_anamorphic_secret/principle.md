# Anamorphic / Observer-Dependent Moiré — Moiré as Secret

## The Phenomenon

The moiré only resolves from *one viewpoint*. From other angles, it's noise. The grids are distorted such that their interference only aligns when viewed from a specific `eyePosition`. Move, and the pattern shatters.

## How It Works

1. **Design viewpoint:** A specific 3D position where the moiré resolves
2. **Distorted grid A:** A grid that looks "wrong" from most angles
3. **Distorted grid B:** Another grid, distorted in a complementary way
4. **Alignment:** Only from the design viewpoint do both grids project to the same screen-space pattern, creating interference

## Mathematical Core

Given:
- Grid A defined on plane P_A with transform T_A
- Grid B defined on plane P_B with transform T_B
- Eye position E

The screen-space projection of each grid is:
```
uv_A = project(T_A * P_A, E)
uv_B = project(T_B * P_B, E)
```

The moiré exists where `uv_A ≈ uv_B`. This only happens when E is at the design viewpoint.

## The Secret

The moiré is **information that requires a specific observer**. It's like a hologram that only exists for one person, or a message that self-destructs when viewed from the wrong angle.

## Applications

- **Privacy screens:** Only visible from directly in front
- **Art installations:** The artwork "appears" as you walk to the sweet spot
- **Authentication:** A moiré watermark that only verifies from a specific camera position
- **Narrative:** The secret reveals itself to the patient observer

## Anamorphosis Types

| Type | Distortion | Viewing Requirement |
|------|-----------|---------------------|
| Perspective | Projective geometry | Specific eye position |
| Cylindrical | Curved surface | Specific cylindrical position |
| Conical | Conical projection | Specific cone apex |
| Mirror | Reflective surface | Specific mirror position |
| Lenticular | Lens array | Specific lateral position |
