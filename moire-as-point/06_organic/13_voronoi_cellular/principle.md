# Voronoi / Cellular Moiré — Moiré of the Irregular

## The Phenomenon

Two Voronoi diagrams at different scales, overlaid. The interference happens at the *cell boundaries* — moiré of irregular tessellations. Not geometric bands — *membranes*, *veins*, *cracks*. The moiré of the irregular.

## Why It's Different

All previous techniques use *periodic* or *quasiperiodic* gratings. Voronoi moiré uses *irregular* structures. The cells are different sizes, different shapes, different orientations. The interference is *local* — it changes character from cell to cell.

## Voronoi Diagram Basics

Given a set of "seed" points, the Voronoi diagram divides space into regions where each region contains all points closer to one seed than any other. The boundaries are perpendicular bisectors between seed pairs.

In shader terms:
```glsl
float voronoi(vec2 uv, float scale) {
    vec2 cell = floor(uv * scale);
    float minDist = 1e5;

    // Check neighboring cells
    for(int y = -1; y <= 1; y++) {
        for(int x = -1; x <= 1; x++) {
            vec2 neighbor = cell + vec2(float(x), float(y));
            vec2 neighborPoint = neighbor + hash(neighbor);
            float dist = length(uv - neighborPoint / scale);
            minDist = min(minDist, dist);
        }
    }
    return minDist;
}
```

## The Moiré of Irregularity

When two Voronoi fields at different scales overlap:
- Where cell boundaries *align*, you get bright/dark lines (constructive interference)
- Where boundaries *cross*, you get complex junctions (destructive interference)
- The moiré is *tangled* — no straight bands, only curved, branching, splitting lines

## Biological Analogues

Voronoi patterns appear in:
- **Cell membranes:** Biological cells pack like Voronoi cells
- **Leaf veins:** Vascular networks branch and rebranch
- **Crack patterns:** Drying mud, fractured glass
- **Foam structures:** Bubble boundaries minimize surface area

Voronoi moiré amplifies these natural patterns through interference.

## The Edge-Distance Interference

Instead of interfering the cell *IDs*, interfere the *distance-to-edge*:
```glsl
float edgeDist1 = voronoiEdgeDistance(uv, scale1);
float edgeDist2 = voronoiEdgeDistance(uv, scale2);
float moire = abs(edgeDist1 - edgeDist2);
```

This creates interference at the *boundaries* — the moiré traces the contour lines of the Voronoi tessellation.
