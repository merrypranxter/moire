// Voronoi / Cellular Moiré — Moiré of the Irregular

// Hash function for pseudo-random seed points
vec2 hash22(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

// Voronoi distance field
float voronoi(vec2 uv, float scale) {
    vec2 cell = floor(uv * scale);
    vec2 f = fract(uv * scale);

    float minDist = 1.0;
    vec2 nearestPoint;

    // Check 3x3 neighborhood
    for(int y = -1; y <= 1; y++) {
        for(int x = -1; x <= 1; x++) {
            vec2 neighbor = vec2(float(x), float(y));
            vec2 neighborPoint = neighbor + hash22(cell + neighbor);
            vec2 diff = neighborPoint - f;
            float dist = length(diff);
            if(dist < minDist) {
                minDist = dist;
                nearestPoint = neighborPoint;
            }
        }
    }
    return minDist;
}

// Voronoi edge distance (distance to nearest boundary)
float voronoiEdge(vec2 uv, float scale) {
    vec2 cell = floor(uv * scale);
    vec2 f = fract(uv * scale);

    float minDist = 1.0;
    float secondMinDist = 1.0;

    for(int y = -1; y <= 1; y++) {
        for(int x = -1; x <= 1; x++) {
            vec2 neighbor = vec2(float(x), float(y));
            vec2 neighborPoint = neighbor + hash22(cell + neighbor);
            float dist = length(neighborPoint - f);
            if(dist < minDist) {
                secondMinDist = minDist;
                minDist = dist;
            } else if(dist < secondMinDist) {
                secondMinDist = dist;
            }
        }
    }
    return secondMinDist - minDist;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: Fine Voronoi
    float v1 = voronoiEdge(uv, 15.0);

    // Layer 2: Coarser Voronoi, offset
    vec2 offset = vec2(sin(iTime * 0.1) * 0.2, cos(iTime * 0.08) * 0.2);
    float v2 = voronoiEdge(uv + offset, 8.0);

    // Layer 3: Medium Voronoi, different seed
    float v3 = voronoiEdge(uv * 1.1, 12.0);

    // The moiré is the interference between edge distances
    float moire = abs(v1 - v2) + abs(v2 - v3) * 0.5;

    // Invert: boundaries are bright
    moire = 1.0 - smoothstep(0.0, 0.3, moire);

    // Optional: color by cell ID
    vec2 cell1 = hash22(floor(uv * 15.0));
    vec3 color = vec3(moire);
    color.r += cell1.x * 0.3;
    color.g += cell1.y * 0.3;

    fragColor = vec4(color, 1.0);
}
