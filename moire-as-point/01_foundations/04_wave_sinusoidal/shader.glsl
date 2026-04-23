// Sinusoidal Moiré — Soft Interference

float sineGrating(vec2 uv, float freq, float angle, float phase) {
    // Rotate UV by angle
    vec2 dir = vec2(cos(angle), sin(angle));
    float x = dot(uv, dir);
    return 0.5 + 0.5 * sin(x * freq + phase);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: Horizontal sine wave
    float g1 = sineGrating(uv, 40.0, 0.0, iTime * 0.2);

    // Layer 2: Slightly different frequency, diagonal
    float g2 = sineGrating(uv, 42.0, 0.785, -iTime * 0.15);

    // Layer 3: Vertical, slower
    float g3 = sineGrating(uv, 38.0, 1.571, iTime * 0.1);

    // Multiplicative blending = natural interference
    float moire = g1 * g2 * g3;

    // The product contains the difference frequency
    // Extract it with contrast push
    moire = pow(moire, 0.7); // gamma correction for visibility

    // Optional: create "liquid" effect by adding subtle noise
    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453) * 0.02;
    moire += noise;

    fragColor = vec4(vec3(moire), 1.0);
}
