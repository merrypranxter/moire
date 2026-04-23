# Audio-Reactive Moiré — Sound Made Visible

## The Phenomenon

Grids modulated by audio frequencies — bass drives scale, treble drives rotation, mids drive offset. The moiré becomes a *real-time spectrogram* — but spatial, not temporal. You see the *beat* between sound frequencies as visual beats.

## How It Works

1. **Audio analysis:** FFT or band-pass filters extract frequency components
2. **Parameter mapping:** Audio features drive moiré parameters:
   - Amplitude → grid opacity/contrast
   - Bass (20-250Hz) → grid scale (large scale = low freq)
   - Mids (250-2000Hz) → grid offset speed
   - Treble (2000-20000Hz) → grid rotation speed
   - Transients → momentary perturbation

3. **Moiré generation:** The grids interfere, and the audio-driven parameters make the interference *dance* to the music

## The Audio-Moiré Isomorphism

Sound and moiré share the same mathematics:
- **Beat frequencies:** Two tones close in pitch create audible beats. Two grids close in scale create visual beats.
- **Harmonics:** Musical harmonics are integer multiples of a fundamental. Grid harmonics are integer multiples of a base frequency.
- **Chords:** Multiple tones create complex timbres. Multiple grids create complex moiré.
- **Spectrum:** A sound spectrum is a frequency decomposition. A moiré pattern is a spatial frequency decomposition.

The audio-reactive moiré is a **direct mapping** between auditory and visual frequency spaces.

## Parameter Mapping Strategies

| Audio Feature | Moiré Parameter | Effect |
|---------------|-----------------|--------|
| Bass amplitude | Grid scale | Large pulses on bass hits |
| Mid amplitude | Offset speed | Faster drift on mids |
| Treble amplitude | Rotation speed | Spinning on high frequencies |
| Spectral centroid | Grid density | Brighter sounds = finer grids |
| Onset detection | Momentary scale jump | Sharp transients = sharp moiré shifts |
| RMS (loudness) | Overall contrast | Louder = more visible moiré |

## The Synesthetic Experience

When audio and visual are tightly coupled, the moiré becomes *synesthetic* — you "see" the sound rather than just watching a visualization. The beat frequencies in the audio *are* the beat frequencies in the visual. The experience is unified.
