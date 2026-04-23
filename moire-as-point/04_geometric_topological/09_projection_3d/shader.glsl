// Projection / 3D Topology Moiré — Moiré as Scanner

// Simple 3D surface: a displaced plane
float surfaceHeight(vec2 p) {
    // Combine sine waves for interesting topology
    float h = sin(p.x * 3.0) * cos(p.y * 2.0) * 0.3;
    h += sin(p.x * 7.0 + iTime * 0.5) * 0.1;
    h += cos(p.y * 5.0 + iTime * 0.3) * 0.15;
    return h;
}

float grid(vec2 uv, float scale) {
    vec2 st = uv * scale;
    vec2 grid = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(grid));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Reference grid (viewed directly)
    float reference = grid(uv, 30.0);

    // Projected grid: distorted by surface height
    float height = surfaceHeight(uv);

    // The projection shifts UV based on height and view angle
    float projectionAngle = 0.3; // radians
    vec2 projectedUV = uv + vec2(height * tan(projectionAngle), 0.0);

    float projected = grid(projectedUV, 30.0);

    // The moiré is the interference between reference and projected
    float moire = reference + projected;

    // Push contrast to make contour fringes visible
    moire = smoothstep(0.5, 2.0, moire);

    // Optional: color by height
    vec3 color = vec3(moire);
    color.r += height * 0.5 + 0.5;
    color.b -= height * 0.5;

    fragColor = vec4(color, 1.0);
}

// Alternative: More accurate shadow moiré simulation
/*
float shadowMoire(vec2 uv, float height, float gridScale, float lightAngle) {
    // Light projects grid onto surface
    vec2 lightUV = uv + vec2(height * tan(lightAngle), 0.0);
    float shadowGrid = grid(lightUV, gridScale);

    // Viewer sees reference grid through shadow
    float referenceGrid = grid(uv, gridScale);

    // Interference
    return abs(shadowGrid - referenceGrid);
}
*/
