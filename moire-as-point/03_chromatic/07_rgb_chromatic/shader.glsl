// Chromatic RGB Moiré — Color as Interference

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 grid = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(grid));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Each channel is an independent moiré system
    // Slightly different scales create chromatic interference

    // Red channel
    vec2 offsetR = vec2(
        sin(iTime * 0.1) * 0.5,
        cos(iTime * 0.07) * 0.3
    );
    float r = grid(uv, 40.0, offsetR);

    // Green channel — different scale + offset
    vec2 offsetG = vec2(
        sin(iTime * 0.12) * 0.5,
        cos(iTime * 0.09) * 0.3
    );
    float g = grid(uv, 40.3, offsetG);

    // Blue channel — different scale + offset again
    vec2 offsetB = vec2(
        sin(iTime * 0.15) * 0.5,
        cos(iTime * 0.11) * 0.3
    );
    float b = grid(uv, 40.6, offsetB);

    // Combine: each channel's moiré is independent
    // The color emerges from spatial interference
    vec3 moire = vec3(r, g, b);

    // Optional: push contrast per channel
    moire.r = smoothstep(0.2, 1.0, moire.r);
    moire.g = smoothstep(0.2, 1.0, moire.g);
    moire.b = smoothstep(0.2, 1.0, moire.b);

    // Optional: boost saturation by exaggerating differences
    float avg = (moire.r + moire.g + moire.b) / 3.0;
    moire = mix(vec3(avg), moire, 1.5);

    fragColor = vec4(moire, 1.0);
}
