// CMYK Separation Moiré — The Print Ghost

float halftoneDot(vec2 uv, float scale, float angle, vec2 offset) {
    // Rotate UV by angle
    float c = cos(angle);
    float s = sin(angle);
    vec2 rotUV = vec2(
        uv.x * c - uv.y * s,
        uv.x * s + uv.y * c
    );

    vec2 st = rotUV * scale + offset;
    vec2 grid = abs(fract(st) - 0.5);

    // Circular dot (halftone style)
    float dist = length(grid);
    return smoothstep(0.35, 0.0, dist);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Classic halftone angles (perturbed for moiré)
    float angleC = radians(15.0 + sin(iTime * 0.05) * 5.0);
    float angleM = radians(75.0 + cos(iTime * 0.07) * 5.0);
    float angleY = radians(0.0 + sin(iTime * 0.03) * 3.0);
    float angleK = radians(45.0 + cos(iTime * 0.04) * 4.0);

    // Slightly different scales for each channel
    float scaleC = 35.0;
    float scaleM = 35.5;
    float scaleY = 36.0;
    float scaleK = 34.5;

    // Animated offsets
    vec2 offsetC = vec2(sin(iTime * 0.1) * 0.3, cos(iTime * 0.08) * 0.2);
    vec2 offsetM = vec2(cos(iTime * 0.12) * 0.3, sin(iTime * 0.09) * 0.2);
    vec2 offsetY = vec2(sin(iTime * 0.15) * 0.2, cos(iTime * 0.11) * 0.3);
    vec2 offsetK = vec2(cos(iTime * 0.07) * 0.2, sin(iTime * 0.13) * 0.3);

    // Sample each channel
    float c = halftoneDot(uv, scaleC, angleC, offsetC);
    float m = halftoneDot(uv, scaleM, angleM, offsetM);
    float y = halftoneDot(uv, scaleY, angleY, offsetY);
    float k = halftoneDot(uv, scaleK, angleK, offsetK);

    // Convert CMYK to RGB (subtractive mixing)
    vec3 rgb = vec3(1.0);
    rgb.r *= 1.0 - c;
    rgb.r *= 1.0 - m; // Wait, this is wrong — let's do proper CMYK->RGB

    // Proper CMYK to RGB:
    // R = (1 - C) * (1 - K)
    // G = (1 - M) * (1 - K)
    // B = (1 - Y) * (1 - K)
    float r = (1.0 - c) * (1.0 - k);
    float g = (1.0 - m) * (1.0 - k);
    float b = (1.0 - y) * (1.0 - k);

    // But for moiré effect, we want to SEE the interference
    // So let's use additive mixing instead to make fringes visible:
    vec3 color = vec3(0.0);
    color += vec3(0.0, 1.0, 1.0) * c; // Cyan
    color += vec3(1.0, 0.0, 1.0) * m; // Magenta
    color += vec3(1.0, 1.0, 0.0) * y; // Yellow
    color += vec3(0.0, 0.0, 0.0) * k; // Black (absorbs)

    // Normalize and push contrast
    color = color / (1.0 + k);
    color = smoothstep(0.0, 1.5, color);

    fragColor = vec4(color, 1.0);
}
