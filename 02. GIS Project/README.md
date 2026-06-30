# 🗺️ Field Geology Spatial Mapping & Analytics (QGIS)

## 📝 Project Overview
This project showcases the end-to-end spatial data processing of geological field observations acquired during a field mapping campaign. The core objective was to ingest raw field-acquired coordinates and geological attributes (lithology, structural data), execute spatial operations in **QGIS**, and produce high-quality, cartographic-grade thematic maps used for geological evaluation.

The workflow translates raw field data into a structural framework, isolating lithological boundaries, topographic expressions, and structural orientations.

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
* Georeferenced scanned paper base-maps using control points (GCPs) to align them accurately with the WGS84 coordinate reference system.

### 2. Terrain Analysis & Base Layer Preparation
* Processed **DEMNAS** data to analyze regional morphology.
* Clipped (`Vector -> Geoprocessing -> Clip`) the massive regional base layers (rivers, roads, and contours) using the specific field-work boundary polygon to optimize processing speed and map focus.

### 3. Digitization & Feature Engineering
* **Geological Outcrops & Tracks:** Digitized field traverse tracks and outcrop locations.
* **Lithological Boundaries:** Polygonal digitization based on field observations to differentiate rock units.

### 4. Cartographic Layout & Visualization
* Applied strike and dip symbology for structural data.
* Designed professional legends, scale bars, north arrows, and grid systems in the QGIS Print Layout.

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
