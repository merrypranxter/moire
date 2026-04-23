// Anamorphic Moiré — Observer-Dependent Secret

// The "secret" grid: only visible from specific viewpoint
float secretGrid(vec2 uv, float scale) {
    vec2 st = uv * scale;
    vec2 grid = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(grid));
}

// Distort UV based on eye position (simulated as mouse or time)
vec2 anamorphicDistort(vec2 uv, vec2 eyePos, float strength) {
    // Perspective distortion: objects appear to shift based on eye position
    vec2 offset = (uv - eyePos) * strength;
    return uv + offset;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Eye position: can be mouse, time-driven, or fixed "sweet spot"
    vec2 eyePos = vec2(
        sin(iTime * 0.2) * 0.5,
        cos(iTime * 0.15) * 0.3
    );
    // Alternative: vec2 eyePos = (iMouse.xy - 0.5 * iResolution.xy) / iResolution.y;

    // Grid A: distorted one way
    vec2 uvA = anamorphicDistort(uv, eyePos + vec2(0.2, 0.0), 0.3);
    float gA = secretGrid(uvA, 40.0);

    // Grid B: distorted the complementary way
    vec2 uvB = anamorphicDistort(uv, eyePos - vec2(0.2, 0.0), -0.3);
    float gB = secretGrid(uvB, 40.2);

    // The moiré only appears when eyePos is "correct"
    float moire = gA + gB;

    // Contrast push
    moire = smoothstep(0.5, 2.0, moire);

    // Optional: show "noise" when not aligned
    float alignment = 1.0 - length(uv - eyePos) * 2.0;
    alignment = clamp(alignment, 0.0, 1.0);

    // The secret is only visible when aligned
    float secret = moire * alignment;

    // Add noise for "wrong viewpoint" feel
    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453) * 0.3;
    secret += noise * (1.0 - alignment);

    fragColor = vec4(vec3(secret), 1.0);
}
