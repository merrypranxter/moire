// Square Lattice Moiré — The Archetype
// Two (or more) square grids with relative motion

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 grid = abs(fract(st) - 0.5);
    float dot = smoothstep(0.05, 0.0, length(grid)); // square-ish dots
    return dot;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: base grid
    float g1 = grid(uv, 40.0, vec2(0.0));

    // Layer 2: offset grid, moving — slightly different scale = moiré
    vec2 offset2 = vec2(
        sin(iTime * 0.1) * 0.5,
        cos(iTime * 0.07) * 0.3
    );
    float g2 = grid(uv, 40.2, offset2);

    // Layer 3: larger scale, slower — creates super-patterns
    vec2 offset3 = vec2(
        cos(iTime * 0.05) * 0.2,
        sin(iTime * 0.03) * 0.4
    );
    float g3 = grid(uv, 20.0, offset3);

    // Combine: additive creates bright fringes where all align
    float moire = g1 + g2 + g3;

    // Push contrast to make fringes pop
    moire = smoothstep(0.5, 2.0, moire);

    fragColor = vec4(vec3(moire), 1.0);
}
