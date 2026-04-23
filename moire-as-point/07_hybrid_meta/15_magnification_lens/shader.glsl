// Moiré Magnification — Moiré as Lens

// The underlying image (procedural)
float imagePattern(vec2 uv) {
    // Create a simple "target" image — concentric rings
    float r = length(uv);
    float rings = sin(r * 30.0) * 0.5 + 0.5;

    // Add some structure
    float cross = abs(uv.x * uv.y) * 50.0;
    cross = smoothstep(0.0, 1.0, cross);

    return rings * 0.7 + cross * 0.3;
}

// Pinhole mask
float pinholeMask(vec2 uv, float pinholeScale, vec2 offset) {
    vec2 st = uv * pinholeScale + offset;
    vec2 grid = abs(fract(st) - 0.5);
    float dist = length(grid);
    // Small pinholes
    return smoothstep(0.15, 0.0, dist);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // The hidden image
    float image = imagePattern(uv);

    // Pinhole mask — slightly different scale creates magnification
    float pinholeScale = 35.0;
    vec2 maskOffset = vec2(
        sin(iTime * 0.05) * 0.1,
        cos(iTime * 0.04) * 0.1
    );
    float mask = pinholeMask(uv, pinholeScale, maskOffset);

    // The moiré magnification
    // When image frequency ≈ pinhole frequency, magnification occurs
    float magnified = image * mask;

    // Push contrast to make the magnified image visible
    magnified = smoothstep(0.0, 0.5, magnified);

    // Optional: show the raw image faintly for context
    float rawImage = image * 0.1;

    // Optional: show the mask faintly
    float rawMask = mask * 0.1;

    vec3 color = vec3(magnified + rawImage + rawMask);

    // Color the magnified image
    color.r = magnified * 1.5 + rawImage;
    color.g = magnified * 0.8 + rawMask;
    color.b = magnified * 0.5;

    fragColor = vec4(color, 1.0);
}
