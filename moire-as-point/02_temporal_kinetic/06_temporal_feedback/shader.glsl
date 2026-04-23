// Temporal Feedback Moiré — Moiré as Memory

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 grid = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(grid));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;
    vec2 texUV = fragCoord / iResolution.xy;

    // Current frame grid
    vec2 offset = vec2(
        sin(iTime * 0.3) * 0.5,
        cos(iTime * 0.2) * 0.5
    );
    float current = grid(uv, 35.0, offset);

    // Feedback from previous frame
    vec3 prev = texture(iChannel0, texUV).rgb;
    float feedback = prev.r;

    // Mix: high decay = long memory
    float decay = 0.92;
    float moire = mix(current, feedback, decay);

    // Optional: add second layer with different temporal scale
    vec2 offset2 = vec2(
        cos(iTime * 0.15) * 0.3,
        sin(iTime * 0.25) * 0.3
    );
    float current2 = grid(uv, 35.5, offset2);

    // Different decay for second layer = layered memory
    float moire2 = mix(current2, feedback, 0.85);

    // Combine layers
    float final = moire + moire2 * 0.5;

    // Contrast push
    final = smoothstep(0.2, 1.5, final);

    fragColor = vec4(vec3(final), 1.0);
}

// Note: iChannel0 must be set to the previous frame buffer
// In Shadertoy: Buffer A -> Image, with Buffer A sampling itself
