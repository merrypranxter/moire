// Perturbed / Organic Grids — Moiré with Imperfection

// Simplex noise (simplified)
vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec2 mod289(vec2 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec3 permute(vec3 x) { return mod289(((x*34.0)+1.0)*x); }

float snoise(vec2 v) {
    const vec4 C = vec4(0.211324865405187, 0.366025403784439,
                       -0.577350269189626, 0.024390243902439);
    vec2 i  = floor(v + dot(v, C.yy));
    vec2 x0 = v - i + dot(i, C.xx);
    vec2 i1;
    i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    vec4 x12 = x0.xyxy + C.xxzz;
    x12.xy -= i1;
    i = mod289(i);
    vec3 p = permute(permute(i.y + vec3(0.0, i1.y, 1.0))
        + i.x + vec3(0.0, i1.x, 1.0));
    vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy),
        dot(x12.zw,x12.zw)), 0.0);
    m = m*m;
    m = m*m;
    vec3 x = 2.0 * fract(p * C.www) - 1.0;
    vec3 h = abs(x) - 0.5;
    vec3 ox = floor(x + 0.5);
    vec3 a0 = x - ox;
    m *= 1.79284291400159 - 0.85373472095314 * (a0*a0 + h*h);
    vec3 g;
    g.x = a0.x * x0.x + h.x * x0.y;
    g.yz = a0.yz * x12.xz + h.yz * x12.yw;
    return 130.0 * dot(m, g);
}

// Fractional Brownian Motion
float fbm(vec2 p) {
    float sum = 0.0;
    float amp = 0.5;
    float freq = 1.0;
    for(int i = 0; i < 5; i++) {
        sum += amp * snoise(p * freq);
        freq *= 2.0;
        amp *= 0.5;
    }
    return sum;
}

float grid(vec2 uv, float scale, vec2 offset) {
    vec2 st = uv * scale + offset;
    vec2 g = abs(fract(st) - 0.5);
    return smoothstep(0.05, 0.0, length(g));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Perturbation field
    float noiseScale = 2.0;
    float noiseAmp = 0.15;
    vec2 perturbation = vec2(
        fbm(uv * noiseScale + iTime * 0.1),
        fbm(uv * noiseScale + vec2(5.2, 1.3) + iTime * 0.1)
    ) * noiseAmp;

    // Layer 1: Perturbed grid
    vec2 off1 = vec2(sin(iTime * 0.1) * 0.3, cos(iTime * 0.08) * 0.3);
    float g1 = grid(uv + perturbation, 35.0, off1);

    // Layer 2: Different perturbation
    vec2 perturbation2 = vec2(
        fbm(uv * noiseScale * 1.5 + vec2(10.0, 3.0) + iTime * 0.15),
        fbm(uv * noiseScale * 1.5 + vec2(15.0, 8.0) + iTime * 0.15)
    ) * noiseAmp * 0.8;

    vec2 off2 = vec2(cos(iTime * 0.12) * 0.3, sin(iTime * 0.09) * 0.3);
    float g2 = grid(uv + perturbation2, 35.5, off2);

    // Domain warping: use grid value to further perturb
    float warpStrength = 0.1;
    vec2 warpedUV = uv + vec2(g1, g2) * warpStrength;
    float g3 = grid(warpedUV, 20.0, vec2(0.0));

    // Moiré
    float moire = g1 + g2 + g3 * 0.5;
    moire = smoothstep(0.3, 1.5, moire);

    // Color by perturbation strength
    vec3 color = vec3(moire);
    color.r += length(perturbation) * 2.0;
    color.b += length(perturbation2) * 2.0;

    fragColor = vec4(color, 1.0);
}
