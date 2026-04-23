// Data Moiré — Information Interference

// Simulated datasets (replace with real data)
float datasetA(vec2 uv) {
    // Simulated temperature field
    return sin(uv.x * 3.0) * cos(uv.y * 2.0) * 0.5 + 0.5;
}

float datasetB(vec2 uv) {
    // Simulated rainfall field
    return cos(uv.x * 2.0 + iTime * 0.1) * sin(uv.y * 4.0) * 0.5 + 0.5;
}

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 g = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(g));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Sample datasets
    float dataA = datasetA(uv);
    float dataB = datasetB(uv);

    // Encode data into grid parameters
    float scaleA = 20.0 + dataA * 20.0; // Data A drives scale
    float scaleB = 20.0 + dataB * 20.0; // Data B drives scale

    vec2 offsetA = vec2(
        sin(dataA * 6.28) * 0.3,
        cos(dataA * 6.28) * 0.3
    );
    vec2 offsetB = vec2(
        cos(dataB * 6.28) * 0.3,
        sin(dataB * 6.28) * 0.3
    );

    // Grid A: encodes dataset A
    float gA = grid(uv, scaleA, offsetA);

    // Grid B: encodes dataset B
    float gB = grid(uv, scaleB, offsetB);

    // The moiré is the interference between datasets
    float moire = gA + gB;

    // Contrast push
    moire = smoothstep(0.3, 1.5, moire);

    // Color by data values
    vec3 color = vec3(0.0);
    color.r = dataA; // Dataset A in red
    color.b = dataB; // Dataset B in blue
    color.g = moire; // Interference in green

    // Highlight correlation regions (where data values are similar)
    float correlation = 1.0 - abs(dataA - dataB);
    color += vec3(correlation * 0.3);

    fragColor = vec4(color, 1.0);
}
