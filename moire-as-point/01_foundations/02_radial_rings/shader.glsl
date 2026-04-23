// Radial Ring Moiré — Concentric Interference

float ring(vec2 uv, float centerScale, float ringFreq, vec2 center, float offset) {
    float r = length(uv - center);
    float ring = sin(r * ringFreq + offset) * 0.5 + 0.5;
    // Sharpen to binary-like rings
    ring = smoothstep(0.4, 0.6, ring);
    return ring;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: Base rings
    float r1 = ring(uv, 1.0, 80.0, vec2(0.0), 0.0);

    // Layer 2: Slightly different frequency, moving center
    vec2 center2 = vec2(
        sin(iTime * 0.1) * 0.05,
        cos(iTime * 0.07) * 0.05
    );
    float r2 = ring(uv, 1.0, 82.0, center2, iTime * 0.2);

    // Layer 3: Larger scale, slower drift
    vec2 center3 = vec2(
        cos(iTime * 0.03) * 0.02,
        sin(iTime * 0.05) * 0.02
    );
    float r3 = ring(uv, 1.0, 40.0, center3, -iTime * 0.1);

    // Combine: additive for bright fringes
    float moire = r1 + r2 + r3;

    // Contrast push
    moire = smoothstep(0.8, 2.5, moire);

    // Optional: radial falloff for vignette effect
    float vignette = 1.0 - length(uv) * 0.8;
    moire *= vignette;

    fragColor = vec4(vec3(moire), 1.0);
}
