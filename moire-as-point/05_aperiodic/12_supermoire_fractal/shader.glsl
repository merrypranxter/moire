// Supermoiré — Fractal Interference (Moiré of Moiré)

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 g = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(g));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Golden ratio
    float phi = 1.618033988749895;

    // Layer 1: Base scale
    vec2 off1 = vec2(sin(iTime * 0.3) * 0.3, cos(iTime * 0.2) * 0.3);
    float g1 = grid(uv, 40.0, off1);

    // Layer 2: phi scale — beats with layer 1
    vec2 off2 = vec2(cos(iTime * 0.35) * 0.3, sin(iTime * 0.25) * 0.3);
    float g2 = grid(uv, 40.0 * phi, off2);

    // Layer 3: phi^2 scale — beats with the moiré of 1&2
    vec2 off3 = vec2(sin(iTime * 0.15) * 0.2, cos(iTime * 0.1) * 0.2);
    float g3 = grid(uv, 40.0 * phi * phi, off3);

    // Layer 4: phi^3 scale — beats with the supermoiré of 1,2,3
    vec2 off4 = vec2(cos(iTime * 0.08) * 0.15, sin(iTime * 0.06) * 0.15);
    float g4 = grid(uv, 40.0 * phi * phi * phi, off4);

    // First-order moiré: pairwise
    float m12 = g1 * g2;
    float m13 = g1 * g3;
    float m23 = g2 * g3;

    // Second-order moiré: moiré of moiré
    float m123 = m12 * g3;
    float m234 = m23 * g4;

    // Supermoiré: combine all levels
    float supermoire = g1 + g2 * 0.7 + g3 * 0.5 + g4 * 0.3
                     + m12 * 0.8 + m13 * 0.6 + m23 * 0.6
                     + m123 * 1.0 + m234 * 0.8;

    // Normalize and contrast
    supermoire = supermoire / 5.0;
    supermoire = smoothstep(0.1, 0.8, supermoire);

    // Color by hierarchy level
    vec3 color = vec3(0.0);
    color.r = g1 + m12 * 0.5 + m123 * 0.3;
    color.g = g2 + m13 * 0.5 + m234 * 0.3;
    color.b = g3 + m23 * 0.5;
    color = smoothstep(vec3(0.0), vec3(1.0), color);

    fragColor = vec4(color, 1.0);
}
