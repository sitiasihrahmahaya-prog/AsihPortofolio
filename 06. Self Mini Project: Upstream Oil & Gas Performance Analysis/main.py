import pandas as pd
import numpy as np

# Load data mentah (asumsi file produksi_raw.csv diupload di folder yang sama)
df_raw = pd.read_csv('/content/produksi_raw.csv.csv')

# =====================================================================
# OBJECTIVE 1: Data Cleansing & Preparation
# Eliminating negative values, duplicates, and safeguarding NULL entries
# =====================================================================
df_clean = df_raw.copy()

# 1. Rectifying metadata omission (Mengisi nama operator yang kosong)
df_clean['operator'] = df_clean['operator'].fillna('Unknown Operator')
df_clean['operator'] = df_clean['operator'].replace('', 'Unknown Operator')

# 2. Correcting erroneous negative daily oil production figures
# Jika di bawah 0 atau NULL/NaN, diubah jadi 0
df_clean['daily_oil_production_bbl'] = np.where(
    (df_clean['daily_oil_production_bbl'] < 0) | (df_clean['daily_oil_production_bbl'].isna()), 
    0, 
    df_clean['daily_oil_production_bbl']
)

# 3. Protecting water cut percentages bounds (Kunci di range 0% - 100%)
df_clean['water_cut_percentage'] = np.where(df_clean['water_cut_percentage'] < 0, 0, df_clean['water_cut_percentage'])
df_clean['water_cut_percentage'] = np.where(df_clean['water_cut_percentage'] > 100, 100, df_clean['water_cut_percentage'])
df_clean['water_cut_percentage'] = df_clean['water_cut_percentage'].fillna(0)


# =====================================================================
# OBJECTIVE 2 & 3: Performance Benchmarking & High-Level Aggregations
# Summarizing global production limits and sorting by Operator share
# =====================================================================
operator_benchmarking = df_clean.groupby('operator').agg(
    total_active_wells=('well_id', 'nunique'), # COUNT(DISTINCT well_id)
    total_oil_production_bbl_d=('daily_oil_production_bbl', 'sum') # SUM
).reset_index()

# ROUND(..., 2)
operator_benchmarking['total_oil_production_bbl_d'] = operator_benchmarking['total_oil_production_bbl_d'].round(2)

# ORDER BY total_oil_production_bbl_d DESC
operator_benchmarking = operator_benchmarking.sort_values(by='total_oil_production_bbl_d', ascending=False)


# =====================================================================
# OBJECTIVE 4: Operational Efficiency & Risk Mitigation Isolation
# Automating the extraction of high risk, high water-cut wells (>75%)
# =====================================================================
# WHERE water_cut_percentage > 75
high_risk_wells = df_clean[df_clean['water_cut_percentage'] > 75]

# SELECT well_id, well_name, operator, water_cut_percentage, daily_oil_production_bbl
high_risk_wells = high_risk_wells[['well_id', 'well_name', 'operator', 'water_cut_percentage', 'daily_oil_production_bbl']]

# ORDER BY water_cut_percentage DESC
high_risk_wells = high_risk_wells.sort_values(by='water_cut_percentage', ascending=False)


# =====================================================================
# PRINT RESULTS (Optional - Untuk mengecek hasil di terminal/console)
# =====================================================================
print("--- OBJECTIVE 2 & 3: OPERATOR BENCHMARKING ---")
print(operator_benchmarking.to_string(index=False))

print("\n--- OBJECTIVE 4: HIGH RISK WELLS (>75% WATER CUT) ---")
print(high_risk_wells.to_string(index=False))
