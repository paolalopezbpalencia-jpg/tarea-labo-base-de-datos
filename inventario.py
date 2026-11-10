import streamlit as st
import pandas as pd

def mostrar_inventario():
    st.header("📦 Control de Inventario")
    st.write("Vista general de las existencias actuales en planta.")

    datos = {
        "Código": ["P001", "P002", "P003", "P004"],
        "Descripción": ["Bolsas PEAD", "Bolsas PEBD", "Rollos 100 lb", "Resina Base"],
        "Stock Actual": [1500, 800, 120, 50],
        "Estado": ["🟢 Óptimo", "🟡 Bajo", "🔴 Crítico", "🔴 Crítico"]
    }
    
    df = pd.DataFrame(datos)
    st.dataframe(df, use_container_width=True, hide_index=True)
    st.info("Nota: La funcionalidad para agregar, editar y eliminar inventario se desarrollará en futuras entregas.")
