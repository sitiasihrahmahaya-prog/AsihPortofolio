# Reservoir Characterization of Menggala Formation Sandstone Reservoir using a Trigonometric Approach to Pseudo Elastic Impedance Lithology (PEI-L) and Curved Pseudo Elastic Impedance (CPEI) Attributes in the “YUNORA” Field, Central Sumatra Basin

[![Degree](https://img.shields.io/badge/Degree-Bachelor%20Thesis%20(S.T.)-blue.svg)](https://itb.ac.id)
[![Institution](https://img.shields.io/badge/Institution-Institut%20Teknologi%20Bandung-blue)](https://itb.ac.id)
[![Field](https://img.shields.io/badge/Field-Geophysics-orange)](#)
[![Tools](https://img.shields.io/badge/Tools-Python%20%7C%20Petrel%20%7C%20Hampson--Russell%20(HRS)%20%7C%20Excel-green)](#)

Official Publication: [ITB Digital Library Repository](https://digilib.itb.ac.id/gdl/view_data/karakterisasi-reservoir-batupasir-formasi-menggala-menggunakan-pendekatan-trigonometri-terhadap-atribut-pseudo-elastic-impedance-lithology-pei-l-dan-curved-pseudo-elastic-impedance-cpei-pada-lapangan/?rows=605&per_page=44)
---

## Overview

This repository contains a summary of the methodology, data processing workflow, and research findings of the **Undergraduate Bachelor's Thesis in Geophysics Engineering at Institut Teknologi Bandung (ITB)** by **Siti Asih Rahmahaya**, supervised by **Ignatius Sonny Winardhi, Ph.D.** and **Ekkal Dinanto, S.T., M.T.**

### Key Challenges & Objectives
- **Problem:** The target sandstone reservoir of the Menggala Formation in the "YUNORA" Field has a thickness below the seismic vertical resolution limit (*tuning thickness*), making it difficult to delineate using conventional deterministic inversion.
- **Solution:** Applied advanced AVO data processing (Ursenbach-Stewart approximation) and **Extended Elastic Impedance (EEI) Inversion** based on **Linear Programming Sparse Spike (LPSS)**, combined with a **trigonometric** approach to formulate two key attributes:
  1. **PEI-L (Pseudo Elastic Impedance Lithology):** Maps lateral porosity distribution.
  2. **CPEI (Curved Pseudo Elastic Impedance):** Indicates the presence and segregation of hydrocarbon saturation.

---

## Tech Stack & Software
- **Software:** Petrel & Hampson-Russell (HRS) Suite
- **Programming & Analysis:** Python (AVO Ursenbach-Stewart, EEI Chi Angle Optimization, Numerical Inversion, Data Plotting), Microsoft Excel
- **Dataset:** 3D PSTM Gather Seismik, 3 Well Data (SIP-1, SIP-2, SIP-3) & Velocity Data

---

## Workflow & Methodology

<p align="left">
  <img src="docs/flowchart_1.png" width="52%" /> <img src="docs/flowchart_2.png" width="38%" />
</p>

---

## Key Technical Steps:
1. **Seismic Pre-Conditioning:** Angle Muting ($0^\circ-40^\circ$), Trim Statics, Super Gather ($3 \times 3$), Angle Gather, dan Bandwidth Matching.
2. **AVO & Inversion:** Ekstraksi volume $R_p$ dan $R_s$ menggunakan aproksimasi Ursenbach-Stewart (2008), dilanjutkan inversi LPSS untuk P-Impedance, S-Impedance, dan EEI $V_p/V_s$.
3. **Trigonometric Attribute Formulation:**
   $$\text{PEIL} = -AI^n \left(\frac{V_p}{V_s}\right) \sin\theta + AI^n \left(\frac{V_s}{V_p}\right) \cos\theta$$
   $$\text{CPEI} = AI^n \left(\frac{V_p}{V_s}\right) \cos\theta + AI^n \left(\frac{V_s}{V_p}\right) \sin\theta$$

---

## Key Findings & Results

- **Parameter Sensitivity:** The combination of the $V_p/V_s$ ratio and *Acoustic Impedance* (AI) proved to be highly sensitive in discriminating high-porosity clean sandstone lithology from shale, particularly within the interval from Lower Menggala to Upper Pematang.
  
<p align="left">
  <img src="docs/rpt_CPEI_crossplot.png" width="48%" /> <img src="docs/rpt_peil_crossplot.png" width="50%" />
</p>

- **EEI Inversion Performance:** The $V_p/V_s$ volume derived from EEI inversion achieved a significantly higher correlation coefficient with well log data compared to conventional AI/SI inversion results.

<p align="left">
  <img src="docs/seismic_inversion_sections.png" width="48%" /> <img src="docs/inversion_crossplot_comparison.png" width="50%" />
</p>

- **Prospective Zones:** 
  - Main hydrocarbon prospects were identified in the **Northern** area (structural high).
  - Potential accumulations in the **Southern** area are linked by **NW-SE** trending faults acting as migration pathways from the source rock (auxinic shale of the Upper Pematang Formation) to the Menggala Formation reservoir.

<p align="center">
  <img src="docs/horizon_slicing_maps.png" width="70%" />
</p>
<p align="center" style="margin-top: -10px;">
  <img src="docs/structural_fault_interpretation.png" width="75%" />
</p>

---

## Citation Guidelines

If you refer to or use the research results from this thesis, please cite as follows:

- **Bahasa Indonesia:**
  > Rahmahaya, S. A. (2025): *Karakterisasi Reservoir Batupasir Formasi Menggala Menggunakan Pendekatan Trigonometri terhadap Atribut Pseudo Elastic Impedance Lithology (PEI-L) dan Curved Pseudo Elastic Impedance (CPEI) pada Lapangan "YUNORA", Cekungan Sumatra Tengah*, Tugas Akhir Program Sarjana, Institut Teknologi Bandung.

- **English:**
  > Rahmahaya, S. A. (2025): *Reservoir Characterization of Menggala Formation Sandstone Reservoir using a Trigonometric Approach to Pseudo Elastic Impedance Lithology (PEI-L) and Curved Pseudo Elastic Impedance (CPEI) Attributes in the "YUNORA" Field, Central Sumatra Basin*, Bachelor's Thesis, Institut Teknologi Bandung.

---
© 2025 Siti Asih Rahmahaya — Geophysical Engineering Study Program, Institut Teknologi Bandung.
