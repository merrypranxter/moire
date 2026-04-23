# Variations

## 1. FFT-Driven Multi-Band
Use a full FFT spectrum (32-512 bands) to drive individual grid parameters:
```glsl
for(int i = 0; i < 32; i++) {
    float fft = texture(iChannel0, vec2(float(i) / 32.0, 0.0)).r;
    float scale = 10.0 + float(i) * 2.0;
    moire += grid(uv, scale, offset) * fft;
}
```
Each frequency band drives a different grid scale. The moiré is a *visual spectrum* — low frequencies create large patterns, high frequencies create fine detail.

## 2. Beat Detection Moiré
Detect musical beats (onsets) and use them to trigger moiré "events":
```glsl
if(beatDetected) {
    scale *= 1.5; // Sudden expansion
    rotation += PI / 4.0; // Snap rotation
}
```
The moiré *pulses* with the music — not smooth animation, but rhythmic staccato.

## 3. Harmonic Grid Stack
Use musical harmonic ratios as grid scales:
```glsl
float scale1 = baseScale * 1.0; // Fundamental
float scale2 = baseScale * 2.0; // Octave
float scale3 = baseScale * 3.0; // Fifth
float scale4 = baseScale * 4.0; // Double octave
```
The moiré creates *musical chords* in visual space — consonant intervals produce stable patterns, dissonant intervals produce chaotic interference.

## 4. Tempo-Synced Moiré
Lock the moiré animation to the musical tempo (BPM):
```glsl
float beat = iTime * BPM / 60.0;
float phase = fract(beat); // 0.0 to 1.0 per beat
```
The moiré *quantizes* to the beat grid. Every bar, the pattern resets — creates a "visual metronome" effect.

## 5. Spectral Morphing
Morph between different moiré types based on spectral features:
- Drone/ambient → smooth sinusoidal moiré
- Rhythmic/dance → sharp square grid moiré
- Noise/industrial → Voronoi/perturbed moiré
- Melodic/harmonic → radial/spiral moiré

The moiré *genre* matches the music genre.

## 6. Audio Feedback Moiré
Use the audio output as input to a feedback system:
```glsl
float audioFeedback = texture(prevFrame, uv).r * audioLevel;
moire = mix(currentGrid, audioFeedback, decay);
```
The moiré *remembers* the audio — trails and echoes that decay based on sound amplitude.
