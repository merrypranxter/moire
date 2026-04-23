# Data Moiré / Information Interference — Moiré as Data Visualization

## The Phenomenon

Two datasets plotted as grids. Their interference reveals correlations, differences, anomalies that neither dataset shows alone. Like a diffraction pattern reveals crystal structure, moiré reveals *relational structure* between datasets.

## How It Works

1. **Dataset A:** Encoded as a grid parameter (scale, offset, rotation, density)
2. **Dataset B:** Encoded as another grid parameter
3. **Interference:** The moiré pattern encodes the *relationship* between A and B

## Encoding Strategies

| Data Feature | Grid Parameter | Visual Effect |
|--------------|----------------|---------------|
| Value magnitude | Grid scale | Larger values = finer grids |
| Value change | Offset speed | Faster change = faster drift |
| Value category | Grid angle | Different categories = different orientations |
| Value density | Grid opacity | Dense regions = visible grids |
| Correlation | Scale differential | Correlated = stable moiré; uncorrelated = chaotic moiré |

## The Relational Insight

A single dataset shows *what is*. Two datasets in moiré show *what relates*.

Example: Temperature and rainfall data:
- Temperature grid: scale varies with temp
- Rainfall grid: offset varies with rainfall
- The moiré shows: where do temperature and rainfall patterns *interfere*? Where do they *align*? Where do they *conflict*?

## Anomaly Detection

Anomalies appear as *dislocations* in the moiré:
- A sudden data spike creates a localized fringe shift
- A missing data point creates a "hole" in the interference
- A correlation breakdown creates chaotic moiré where there was once order

The moiré is a *visual anomaly detector* — the human eye is excellent at spotting irregularities in periodic patterns.

## Scientific Applications

- **Seismology:** Interference between seismic wave grids reveals fault structures
- **Astronomy:** Moiré of star position catalogs reveals proper motion patterns
- **Genomics:** Interference between gene expression grids reveals regulatory networks
- **Economics:** Moiré of price/volume grids reveals market structure
- **Climate:** Interference between temperature/precipitation grids reveals teleconnections
