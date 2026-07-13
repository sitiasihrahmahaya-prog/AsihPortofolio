# 🛢️ FluxAudit™ Engine: Multi-Asset Quantity Assurance Consulting Case Study

An end-to-end data analytics pipeline and simulation engine designed to solve **Volumetric Discrepancy (Loss)** issues between upstream wellheads and downstream sales meters in oil and gas production networks. This framework is tailored as a consulting case study for midstream quantity assurance operations.

---

## 🎯 Problem Statement & Business Context
In oil and gas operations, a common critical issue is the systemic volume mismatch between **Total Wellhead Potential** and **Actual Sales Volume**. As a Junior Consultant, this project evaluates the structural losses and provides data-driven mitigation plans:
* **Global Asset Loss:** Historical operations exhibit an average volume deviation of **1.77%**, officially breaching the standard **1.5% maximum uncertainty tolerance limit**.
* **Financial Risk:** The cumulative unaccounted fluid loss has reached approximately **~3,000 bbl**. Under a benchmark crude market price of **$75/bbl**, this variance represents an unmitigated dynamic revenue risk exposure of **>$226,500**.

---

## 🛠️ Tech Stack & Architecture
* **Database Engine:** SQLite3 (Embedded SQL logic for real-time loss & percentage discrepancy calculations).
* **Simulation Core:** Python 3 (Pandas, NumPy for condition-based anomaly tagging).
* **Interactive UI:** Streamlit Web Framework (Multi-page configuration).
* **Business Intelligence:** Looker Studio (For executive-level cross-filtering and financial risk tracking).

---

## 🚀 Key Features

### 1. 📊 Data Engine & SQL Processing (Python)
* Real-time multi-asset aggregation utilizing optimized SQL queries to compute allocation errors directly inside the database layer.
* Dynamic sidebar adjustment for uncertainty tolerance thresholds.
* Automated red-flag exception logs highlighting high-loss assets based on thermodynamic PVT temperature logs.

### 2. 📈 Corporate BI Analytics Platform (Looker Studio Embed)
* Live integrated dashboard tracking global performance benchmarks.
* Executive-level insight card logging system.
* Direct monitoring of global financial risk values ($) to expedite operational meter-proving decisions.

---

## ⚙️ How to Run the Application Locally

```bash
# 1. Clone the repository and enter the main folder
git clone [https://github.com/sitiasihrahmahaya-prog/AsihPortofolio.git](https://github.com/sitiasihrahmahaya-prog/AsihPortofolio.git)
cd AsihPortofolio

# 2. Navigate to this specific project folder
cd "05. FluxAudit - Oil & Gas Consulting"

# 3. Install all required dependencies
pip install -r requirements.txt

# 4. Execute the Streamlit engine
streamlit run app.py
