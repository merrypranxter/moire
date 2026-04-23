# Projection / 3D Topology Moiré — Moiré as Scanner

## The Phenomenon

Project a grid onto a 3D surface, view it through another grid. The moiré fringes become *contour lines* — literal topographic maps of the surface. Each fringe is a line of equal depth. Rotate the object, the contours shift.

## Why It's Huge

The moiré isn't decorative — it's **informational**. It encodes 3D geometry in 2D interference. This is how 3D scanners work in industry, but weaponized for art.

## The Shadow Moiré Method

1. **Reference grid:** A physical or virtual grid at a fixed plane
2. **Object:** A 3D surface between the grid and the viewer
3. **Projection:** The grid's shadow (or projection) falls on the object surface
4. **Interference:** The viewer sees the reference grid *through* the projected grid on the object

Where the object is close to the reference plane, the grids align (bright fringe). Where the object is far, the grids misalign (dark fringe). The fringe spacing encodes depth.

## Mathematical Core

For a surface `z = f(x,y)` viewed from above:
- Reference grid: `sin(2π * f_ref * x)` at `z = 0`
- Projected grid: `sin(2π * f_proj * x)` at `z = f(x,y)`

The phase shift due to depth: `Δφ = 2π * f_proj * f(x,y) * tan(θ)`

Where `θ` is the projection angle. The moiré fringe pattern is:
```
moire(x,y) = sin(Δφ/2) = sin(π * f_proj * f(x,y) * tan(θ))
```

Each fringe is a contour where `f(x,y) = constant`.

## Fringe Order

The "order" of a fringe is how many wavelengths of depth it represents:
- 0th order: `f(x,y) = 0` (the reference plane)
- 1st order: `f(x,y) = λ` (one wavelength of depth)
- 2nd order: `f(x,y) = 2λ`

Higher-order fringes are closer together (steeper slope). The fringe density encodes surface curvature.
