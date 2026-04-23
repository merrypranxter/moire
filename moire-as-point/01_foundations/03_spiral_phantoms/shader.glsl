// Spiral Moiré — The Rotating Phantom

float spiral(vec2 uv, float tightness, float rotation, float arms) {
    float r = length(uv);
    float angle = atan(uv.y, uv.x);

    // Archimedean spiral with rotation
    float spiralPhase = angle + log(r + 0.001) * tightness + rotation;

    // Create arms via sine modulation
    float armPattern = sin(spiralPhase * arms) * 0.5 + 0.5;

    // Sharpen to spiral arms
    armPattern = smoothstep(0.3, 0.7, armPattern);

    return armPattern;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Layer 1: Base spiral
    float s1 = spiral(uv, 3.0, iTime * 0.1, 6.0);

    // Layer 2: Slightly different tightness, counter-rotating
    float s2 = spiral(uv, 3.05, -iTime * 0.12, 6.0);

    // Layer 3: Different arm count, slower
    float s3 = spiral(uv, 2.8, iTime * 0.05, 5.0);

    // Combine: the interference creates phantom spokes
    float moire = s1 * s2 + s3 * 0.5;

    // Push contrast
    moire = smoothstep(0.3, 1.2, moire);

    // Optional: color based on which layers are interfering
    vec3 color = vec3(moire);
    color.r *= 1.0 + s1 * 0.3;
    color.b *= 1.0 + s2 * 0.3;

    fragColor = vec4(color, 1.0);
}
