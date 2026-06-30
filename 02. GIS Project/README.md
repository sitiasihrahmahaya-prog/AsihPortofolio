# Integrated Field Geology & Geophysical Data Processing & Mapping Using QGIS

## Project Overview
This project documents the end-to-end spatial data processing and integrated mapping executed during an official **Geological & Geophysical Fieldwork Course in Karangsambung, Central Java, 2024**. 

The primary objective was to integrate surface geological observations (lithology, structural data) with subsurface geophysical survey traverses. By utilizing **QGIS**, raw field coordinate data and geophysical survey layouts were processed into high-quality, cartographic-grade thematic maps that act as a technical bridge for structural and subsurface geological modeling.

---

## 🛠️ GIS Tech Stack & Tools Used
* **GIS Platform:** QGIS (Quantum GIS)
* **Core Operations:** Georeferencing, Vector Digitization, Area of Interest (AOI) Clipping, Traverse Tracking, Layer Overlay, and Cartographic Layout Composition.
* **Geophysical Methods Integrated:** Gravity, Magnetic, Geoelectric (Sounding & Profiling), ADMT, Electromagnetic, Seismic Refraction, and HVSR.
* **Data Sources & Inputs:** * Field Spreadsheet (Coordinates, Lithology, Structural Attitude, and Geophysical Station Points).
  * Regional Geological Map of Karangsambung (Scanned Sheet).
  * DEMNAS (Digital Elevation Model Nasional) for regional terrain and morphology analysis.
  * Base Layers: Topographic Contours, Hydrographic Network (Rivers), and Infrastructure (Roads) Shapefiles (`.shp`).

---

## 📂 Project Structure & Assets
* 📁 `raw_data/` -> Contains input vector layers, base maps, and survey point CSVs.
* 📁 `stages_screenshots/` -> Contains step-by-step processing screenshots inside QGIS.
* 📁 `final_maps/` -> Contains high-resolution outputs of the finalized geological and geophysical layout maps.
* 📄 [README.md](./README.md) -> This documentation file.

---

## ⚙️ Integrated GIS Workflow

### 1. Data Ingestion, Georeferencing & Projection Setup
* Imported field-acquired coordinates (X, Y) for both geological outcrops and geophysical survey stations.
* Georeferenced the scanned **Regional Geological Map of Karangsambung** by utilizing its printed coordinate grids as Ground Control Points (GCPs).
* Configured the project's Coordinate Reference System (CRS) to **EPSG:32749 - WGS 84 / UTM Zone 49S** to ensure accurate, metric-based distance calculations for all acquisition lines.

### 2. AOI Definition & Base Layer Trimming
* **Crucial Step:** Defined a strict **Area of Interest (AOI) boundary polygon** matching the exact dimensions of the observed field area to prevent data clutter and optimize QGIS rendering performance.
* Clipped (`Vector -> Geoprocessing -> Clip`) the massive regional base layers (rivers, roads, and contours) and **DEMNAS** data to match the predefined field-work boundary.

### 3. Digitization & Traverse Mapping
* **Geological Features:** Digitized geological contact lines, fault splays, and outcrop locations.
* **Geophysical Traverses:** Mapped the exact linear profiles and layout arrays for Gravity, Magnetic, Geoelectric (Sounding & Profiling), ADMT, Electromagnetic, and Seismic Refraction tracks, alongside single-station nodes for HVSR measurements.

### 4. Integration & Cartographic Presentation
* Overlaid geophysical traverse paths onto the geomorphology and lithological boundary layers to correlate subsurface anomalies with surface expressions.
* Applied specific strike-dip symbols and geophysical acquisition node styles.
* Designed professional legends, scale bars, north arrows, and coordinate grids in the QGIS Print Layout.

---

## 🖼️ Process & Workflow Highlights (QGIS Stages)

#### A. Base Layer Clipping & Georeferencing Stage
*Description: Project setup using EPSG:32749 and clipping regional shapefiles to the field AOI.*
![Georeferencing & Clipping Stage](./stages_screenshots/clipping_stage.png)

#### B. Geophysical Line Layout & Digitization
*Description: Mapping the acquisition tracks for multiple geophysical profiles across geological boundaries.*
![Digitization Stage](./stages_screenshots/digitization_stage.png)

---

## 📊 Final Cartographic Deliverables

### 1. Geological Traverse & Outcrop Map
*Purpose: Displays the physical routes taken during field observation, outcrop positions, and surface lithological boundaries.*
![Geological Traverse Map](./final_maps/peta_lintasan_geologi.png)

### 2. Geophysical Acquisition Line Map
*Purpose: Illustrates the spatial distribution and exact tracks of the geophysical surveys relative to local topography and structures.*
![Geophysical Layout Map](./final_maps/peta_lintasan_geofisika.png)

### 3. Geomorphology Map
*Purpose: Illustrates landform classifications derived from contour densities and DEMNAS terrain models.*
![Geomorphology Map](./final_maps/peta_morfologi.png)

---
*Developed as a demonstration of integrated spatial data processing and professional cartographic workflow in Earth Sciences.*
