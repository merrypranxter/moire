# Variations

## 1. Power Diagram Moiré
Use Power diagrams (weighted Voronoi) where each seed has a different "weight." The cells are no longer uniform — some expand, some shrink. The moiré becomes *hierarchical* — large cells contain smaller interference patterns.

## 2. Lloyd's Relaxation Moiré
Apply Lloyd's algorithm (iteratively moving seeds to cell centroids) to create more regular Voronoi cells. The moiré transitions from *crack-like* (random) to *honeycomb-like* (relaxed) as relaxation progresses.

## 3. Anisotropic Voronoi
Distort the distance metric:
```glsl
float dist = length(mat2(2.0, 0.0, 0.0, 0.5) * diff);
```
Creates elongated cells. The moiré has *directional* character — like stretched membranes or aligned fibers.

## 4. Temporal Voronoi
Animate the seed points:
```glsl
vec2 seedPoint = hash22(cell) + sin(iTime + cell.x) * 0.1;
```
The cells *breathe* and *flow*. The moiré is alive — constantly shifting as the underlying tessellation morphs.

## 5. Multi-Metric Moiré
Use different distance metrics for each layer:
- Layer 1: Euclidean (`length(diff)`)
- Layer 2: Manhattan (`abs(diff.x) + abs(diff.y)`)
- Layer 3: Chebyshev (`max(abs(diff.x), abs(diff.y))`)

The moiré compares *different geometries* — the interference is between incompatible spatial logics.

## 6. Voronoi Crack Propagation
Simulate crack growth using Voronoi boundaries as crack paths. The moiré becomes *fracture patterns* — each cell boundary is a potential crack, and the interference shows where cracks would interact.
