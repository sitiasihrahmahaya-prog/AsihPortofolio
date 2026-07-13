import streamlit as st
import pandas as pd
import numpy as np
import sqlite3
import plotly.express as px

st.set_page_config(page_title="FluxAudit™ Engine", layout="wide")

# === 1. CONFIGURATION NAVIGATION (SIDEBAR MENU) ===
st.sidebar.title("🎮 FluxAudit™ Menu")
page = st.sidebar.radio("Navigate to:", ["📊 Data Engine (Python)", "📈 Executive Dashboard (BI)"])

# === SQLITE3 BACKEND PROCESSING ===
def init_sqlite_db():
    # Fixed database naming inconsistency to match the data fetching query
    conn = sqlite3.connect('FluxAudit_simulation.db')
    try:
        df_csv = pd.read_csv('flow_data.csv')
        df_csv.to_sql('production_logs', conn, if_exists='replace', index=False)
    except Exception as e:
        pass
    finally:
        conn.close()

init_sqlite_db()

@st.cache_data
def load_data_from_sqlite():
    # Dynamic analytical queries handled directly in the SQL database layer
    conn = sqlite3.connect('FluxAudit_simulation.db')
    query = """
    SELECT 
        Date,
        Node_ID,
        Node_Name,
        PVT_Temp_C,
        Wellhead_Potential_bbl,
        Actual_Sales_bbl,
        (Wellhead_Potential_bbl - Actual_Sales_bbl) AS Discrepancy_bbl,
        ((Wellhead_Potential_bbl - Actual_Sales_bbl) * 100.0 / Wellhead_Potential_bbl) AS Discrepancy_Pct
    FROM production_logs
    ORDER BY Date ASC
    """
    df = pd.read_sql_query(query, conn)
    conn.close()
    return df

# === 2. MULTI-PAGE CONDITION SPLIT ===

# --- PAGE 1: DATA ENGINE PROCESSING (PYTHON CORE) ---
if page == "📊 Data Engine (Python)":
    st.title("📊 FluxAudit™ Engine: Multi-Asset Quantity Assurance Dashboard")
    
    try:
        df_all = load_data_from_sqlite()

        # Sidebar Filter Configuration
        st.sidebar.markdown("---")
        st.sidebar.header("Asset Filter Configuration")
        selected_node = st.sidebar.selectbox("Select Production Node:", df_all['Node_Name'].unique())
        tolerance = st.sidebar.slider("Set Uncertainty Tolerance Limit (%)", 0.5, 3.0, 1.5)

        df_filtered = df_all[df_all['Node_Name'] == selected_node].reset_index(drop=True)

        # Operational KPI Dashboard Metrics
        st.subheader(f"Asset Status Summary: {selected_node} (Sourced from SQLite3)")
        col1, col2, col3, col4 = st.columns(4)

        total_pot = df_filtered['Wellhead_Potential_bbl'].sum()
        total_act = df_filtered['Actual_Sales_bbl'].sum()
        avg_disc = df_filtered['Discrepancy_Pct'].mean()
        total_loss_val = (total_pot - total_act) * 75

        col1.metric("Total Potential Volume", f"{total_pot:,} bbl")
        col2.metric("Total Actual Sales", f"{total_act:,} bbl")
        col3.metric("Avg Discrepancy (%)", f"{avg_disc:.2f}%")
        col4.metric("Est. Revenue Risk ($)", f"${total_loss_val:,}")

        # Production Trend Charting
        fig = px.line(df_filtered, x='Date', y=['Wellhead_Potential_bbl', 'Actual_Sales_bbl'], 
                      labels={'value': 'Volume (bbl)', 'variable': 'Metrics'},
                      title=f"Volumetric Trends for {selected_node}")
        st.plotly_chart(fig, use_container_width=True)

        # Automated Uncertainty Exception Logs System
        st.subheader("🚨 Automated Quantity Assurance Exception Logs")
        df_filtered['Status'] = np.where(df_filtered['Discrepancy_Pct'] > tolerance, "⚠️ ALERT: High Loss", "✅ Normal")

        def style_status(val):
            color = '#ffcccc' if "ALERT" in val else '#ccffcc'
            return f'background-color: {color}'

        st.dataframe(df_filtered[['Date', 'Wellhead_Potential_bbl', 'Actual_Sales_bbl', 'Discrepancy_Pct', 'PVT_Temp_C', 'Status']]\
                     .style.map(style_status, subset=['Status']))

    except Exception as e:
        st.error(f"❌ System Exception Triggered: {e}")

# --- PAGE 2: EXECUTIVE ENTERPRISE BI DASHBOARD ---
elif page == "📈 Executive Dashboard (BI)":
    st.title("🏛️ Corporate BI Analytics Platform")
    st.caption("Live connection to Looker Studio Executive Dashboard Engine")
    
    # Secure embedding URL for Looker Studio report
    looker_url = "https://lookerstudio.google.com/embed/reporting/f5b274c3-a62d-4dd9-a56f-7122b8ceda3f/page/2Gg3F"
    
    # High-performance iframe container rendering
    st.components.v1.iframe(looker_url, height=750, scrolling=True)