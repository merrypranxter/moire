// Audio-Reactive Moiré — Sound Made Visible

// Simulated audio features (replace with actual audio input)
float bass() {
    return 0.5 + 0.5 * sin(iTime * 2.0); // Simulated bass ~2Hz
}

float mid() {
    return 0.5 + 0.5 * sin(iTime * 5.0); // Simulated mids ~5Hz
}

float treble() {
    return 0.5 + 0.5 * sin(iTime * 12.0); // Simulated treble ~12Hz
}

float onset() {
    return smoothstep(0.8, 1.0, sin(iTime * 3.0) * sin(iTime * 7.0));
}

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 g = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(g));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Audio features
    float b = bass();
    float m = mid();
    float t = treble();
    float o = onset();

    // Map audio to moiré parameters
    float baseScale = 30.0 + b * 20.0; // Bass drives scale
    float offsetSpeed = 0.1 + m * 0.3; // Mids drive speed
    float rotationSpeed = t * 0.5; // Treble drives rotation
    float contrastBoost = 0.5 + o * 1.0; // Onsets boost contrast

    // Layer 1: Bass-driven scale
    vec2 off1 = vec2(
        sin(iTime * offsetSpeed) * 0.3,
        cos(iTime * offsetSpeed * 0.8) * 0.3
    );
    float g1 = grid(uv, baseScale, off1);

    // Layer 2: Mid-driven offset
    vec2 off2 = vec2(
        cos(iTime * offsetSpeed * 1.2) * 0.3,
        sin(iTime * offsetSpeed * 1.5) * 0.3
    );
    float g2 = grid(uv, baseScale * 1.02, off2);

    // Layer 3: Treble-driven rotation
    float angle = iTime * rotationSpeed;
    mat2 rot = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    vec2 rotUV = rot * uv;
    float g3 = grid(rotUV, baseScale * 0.5, vec2(0.0));

    // Combine with audio-driven weights
    float moire = g1 * b + g2 * m + g3 * t;

    // Audio-reactive contrast
    moire = smoothstep(0.3, contrastBoost, moire);

    // Color by frequency band
    vec3 color = vec3(0.0);
    color.r = g1 * b; // Bass = red
    color.g = g2 * m; // Mids = green
    color.b = g3 * t; // Treble = blue

    // Onset flash
    color += vec3(o * 0.5);

    fragColor = vec4(color, 1.0);
}
