# 🗺️ Field Geology Spatial Data Processing & Mapping (QGIS)

## 📝 Project Overview
This project documents the end-to-end spatial data processing executed during an official **Geological Field Mapping Campaign (Kuliah Lapangan) in Karangsambung, Central Java**. The primary objective was to ingest raw, field-acquired geological attributes (coordinates, lithology, structural data), process them within a structured Geographic Information System (GIS) workflow using **QGIS**, and produce high-quality, cartographic-grade thematic maps.

This workflow serves as a technical bridge that translates raw physical field observations into definitive structural maps, isolating lithological boundaries, topographic expressions, and structural orientations.


---

## 🛠️ GIS Tech Stack & Tools Used
* **GIS Platform:** QGIS (Quantum GIS)
* **Core Operations:** Georeferencing, Vector Digitization, Spatial Clipping, Terrain Analysis, and Cartographic Layout Composition.
* **Data Sources & Inputs:** * Raw Field Spreadsheet (Coordinates, Lithology, Structural Attitude)
  * DEMNAS (Digital Elevation Model Nasional) for terrain analysis.
  * Base Layers: Topographic Contours, Hydrographic Network (Rivers), and Infrastructure (Roads) Shapefiles (`.shp`).

---

## 📂 Project Structure & Assets
* 📁 `raw_data/` -> Contains input vector layers (Roads, Rivers, Contours) and CSV coordinates.
* 📁 `stages_screenshots/` -> Contains step-by-step processing screenshots inside QGIS.
* 📁 `final_maps/` -> Contains high-resolution outputs of the finalized geological maps.
* 📄 [README.md](./README.md) -> This documentation file.

---

## ⚙️ Step-by-Step GIS Workflow

### 1. Data Ingestion & Georeferencing
* Imported raw field coordinates (X, Y) containing lithological metadata and geological structures.
* Georeferenced the scanned **Regional Geological Map of Karangsambung** by utilizing its printed coordinate grids as Ground Control Points (GCPs).
* Configured the project's Coordinate Reference System (CRS) to **EPSG:32749 - WGS 84 / UTM Zone 49S** to ensure highly accurate, metric-based distance and area calculations for the Southern Hemisphere.

### 2. AOI (Area of Interest) Definition & Base Layer Preparation
* **Crucial Step:** Defined a strict **Area of Interest (AOI) boundary polygon** matching the exact dimensions of the observed field area. This prevents data clutter and optimizes rendering performance.
* Processed **DEMNAS** data to analyze regional geomorphology and topography within the workspace.
* Clipped (`Vector -> Geoprocessing -> Clip`) the massive regional base layers (rivers, roads, and topographic contours) to match the predefined field-work boundary.

### 3. Digitization & Feature Engineering
* **Geological Outcrops & Tracks:** Digitized field traverse tracks and outcrop locations.
* **Lithological Boundaries:** Polygonal digitization based on field-mapped contacts to differentiate rock formations.

### 4. Cartographic Layout & Visualization
* Applied precise strike and dip symbology for structural data orientations.
* Designed professional legends, scale bars, north arrows, and cross-sections in the QGIS Print Layout.


---

## 🖼️ Process & Workflow Highlights (QGIS Stages)

Here are the key technical stages captured during the map production process in QGIS:

#### A. Base Layer Clipping & Georeferencing Stage
*Description: Aligning coordinate systems and trimming vector assets to the project boundary.*
![Georeferencing & Clipping Stage](./stages_screenshots/clipping_stage.png)

#### B. Vector Digitization & Symbology Assignment
*Description: Digitizing geological contacts and setting up specific lithological color codes.*
![Digitization Stage](./stages_screenshots/digitization_stage.png)

---

## 📊 Final Cartographic Deliverables

Below are the final maps generated from this spatial analysis workflow:

### 1. Traverse & Outcrop Map (Peta Lintasan & Singkapan)
*Purpose: Displays the exact routes taken during field observation and the locations where geological data was captured.*
![Traverse and Outcrop Map](./final_maps/peta_lintasan.png)

### 2. Geomorphology Map (Peta Morfologi)
*Purpose: Illustrates landform classifications derived from contour densities and DEMNAS terrain models.*
![Geomorphology Map](./final_maps/peta_morfologi.png)

---
*Developed as a demonstration of spatial analytics and professional cartographic workflow in Earth Sciences.*
