// Kinegram Cinema — Moiré as Frame Animation

// We simulate a kinegram by interlacing multiple "frames" into one texture
// and using a moving mask to reveal them

float kinegramMask(vec2 uv, float stripWidth, float offset) {
    // Create striped mask: 1.0 = transparent (shows frame), 0.0 = opaque (hides)
    float x = uv.x + offset;
    float strip = fract(x / stripWidth);
    return step(0.5, strip); // 50% duty cycle
}

float interlacedFrame(vec2 uv, int frameIndex, int totalFrames) {
    // Simulate different frames by shifting UV or using different patterns
    // In a real implementation, you'd sample from an interlaced texture

    float shift = float(frameIndex) * 0.1;
    vec2 frameUV = uv + vec2(shift, 0.0);

    // Each frame is a different pattern
    float pattern = sin(frameUV.x * 20.0 + float(frameIndex)) * 
                   cos(frameUV.y * 15.0 + float(frameIndex) * 0.5);
    return pattern * 0.5 + 0.5;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;

    int totalFrames = 8;
    float stripWidth = 1.0 / float(totalFrames);

    // Mask moves with time (or mouse, or scroll)
    float maskOffset = iTime * 0.1;

    // Determine which frame to show based on mask position
    float maskPhase = fract((uv.x + maskOffset) / stripWidth);
    int visibleFrame = int(fract(maskOffset / stripWidth) * float(totalFrames));

    // Sample the interlaced image
    // In practice: sample from a texture where frames are interlaced
    float col = 0.0;

    for(int i = 0; i < 8; i++) {
        float frameMask = kinegramMask(uv, stripWidth, maskOffset + float(i) * stripWidth);
        float frame = interlacedFrame(uv, i, totalFrames);
        col += frame * frameMask;
    }

    // Normalize
    col /= float(totalFrames) * 0.5;

    fragColor = vec4(vec3(col), 1.0);
}

// Alternative: Simplified version using texture interlacing
/*
void mainImage_simple(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;

    // Assume iChannel0 is an interlaced texture with 8 frames
    float stripWidth = 1.0 / 8.0;
    float maskOffset = iTime * 0.1;

    // Which strip column are we in?
    float stripIndex = fract((uv.x + maskOffset) / stripWidth);

    // Sample the interlaced texture at the mask-aligned position
    vec2 sampleUV = vec2(
        floor(uv.x / stripWidth) * stripWidth + (stripIndex * stripWidth),
        uv.y
    );

    vec3 col = texture(iChannel0, sampleUV).rgb;
    fragColor = vec4(col, 1.0);
}
*/
