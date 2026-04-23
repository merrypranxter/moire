# Variations

## 1. Multi-Dataset Moiré
Encode 3+ datasets into a single moiré:
```glsl
float g1 = grid(uv, scale1, offset1); // Dataset A
float g2 = grid(uv, scale2, offset2); // Dataset B
float g3 = grid(uv, scale3, offset3); // Dataset C
float moire = g1 + g2 + g3;
```
The supermoiré reveals *higher-order* correlations — three-way interactions that no pairwise analysis shows.

## 2. Temporal Data Moiré
Animate datasets over time:
```glsl
float dataA = datasetA(uv, iTime);
float dataB = datasetB(uv, iTime);
```
The moiré shows *temporal evolution* of relationships. Watch correlations form, strengthen, weaken, break.

## 3. Geographic Data Moiré
Use latitude/longitude as UV coordinates. The moiré becomes a *map* — interference patterns reveal spatial correlations across geography.

## 4. Network Moiré
Encode graph/network data:
- Nodes = grid seed points
- Edges = connection strength modulates grid alignment
- The moiré shows *community structure* — clusters of aligned grids = network communities

## 5. Uncertainty Moiré
Encode data uncertainty as grid "blur":
```glsl
float blur = uncertainty(uv);
float g = smoothstep(0.05 + blur, 0.0, length(grid));
```
High uncertainty = fuzzy moiré. Low uncertainty = sharp moiré. The visual quality encodes confidence.

## 6. Comparative Moiré
Show two time periods side by side:
```glsl
float dataPast = dataset(uv, timePast);
float dataPresent = dataset(uv, timePresent);
```
The moiré highlights *change* — regions where the interference pattern shifted = regions where data changed.
