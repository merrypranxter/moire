// Penrose / Quasiperiodic Moiré — Never Repeats

// Simplified quasiperiodic function using multiple incommensurate frequencies
float quasiperiodic(vec2 uv, float scale, vec2 offset) {
    // Use golden ratio for irrational frequency ratios
    float phi = 1.618033988749895;

    // Five-fold symmetry via 5 rotated sine waves
    float pattern = 0.0;
    for(int i = 0; i < 5; i++) {
        float angle = float(i) * 2.0 * 3.14159 / 5.0;
        vec2 dir = vec2(cos(angle), sin(angle));
        float freq = scale * (1.0 + float(i) * (phi - 1.0) * 0.1);
        pattern += sin(dot(uv + offset, dir) * freq);
    }

    return pattern * 0.2 + 0.5;
}

// Alternative: Vogel spiral approximation
float vogelSpiral(vec2 uv, float scale, float offset) {
    float r = length(uv);
    float theta = atan(uv.y, uv.x);

    // Golden angle = 137.5 degrees
    float goldenAngle = 2.399963229728653;

    float n = r * scale;
    float spiral = sin(n * goldenAngle + theta + offset);

    return spiral * 0.5 + 0.5;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: Quasiperiodic pattern A
    vec2 offset1 = vec2(
        sin(iTime * 0.08) * 0.2,
        cos(iTime * 0.06) * 0.2
    );
    float q1 = quasiperiodic(uv, 25.0, offset1);

    // Layer 2: Quasiperiodic pattern B — different scale
    vec2 offset2 = vec2(
        cos(iTime * 0.1) * 0.2,
        sin(iTime * 0.07) * 0.2
    );
    float q2 = quasiperiodic(uv, 25.0 * 1.618, offset2);

    // Layer 3: Vogel spiral for organic feel
    float v1 = vogelSpiral(uv, 30.0, iTime * 0.1);

    // The moiré is the interference between quasiperiodic patterns
    float moire = q1 * q2 + v1 * 0.3;

    // Push contrast
    moire = smoothstep(0.2, 1.2, moire);

    // Optional: color by local symmetry
    vec3 color = vec3(moire);
    color.r += q1 * 0.3;
    color.g += q2 * 0.3;
    color.b += v1 * 0.3;

    fragColor = vec4(color, 1.0);
}
