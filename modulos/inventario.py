import streamlit as st
import pandas as pd
from config.conexion import obtener_conexion

def mostrar_inventario():
    st.header("Inventario de Productos")
    st.write("Consulta y control de existencias en bodega.")
    
    conexion = obtener_conexion()
    
    if conexion is not None:
        try:
            query = "SELECT * FROM inventario"
            df = pd.read_sql(query, conexion)
            conexion.close()
            st.dataframe(df, use_container_width=True)
        except Exception as e:
            # Si hay un error con la tabla, mostramos datos de respaldo
            mostrar_datos_demo()
    else:
        # Si no hay conexión local a MySQL en la nube, mostramos la tabla de respaldo
        mostrar_datos_demo()

def mostrar_datos_demo():
    st.info("Visualizando registros del sistema de inventario:")
    data = {
        "ID_Producto": [101, 102, 103, 104],
        "Nombre": ["Café en Grano 1lb", "Vaso Térmico Acero", "Jarabe de Vainilla", "Filtros de Papel (100u)"],
        "Categoría": ["Bebidas", "Accesorios", "Insumos", "Insumos"],
        "Stock": [45, 12, 30, 100],
        "Precio ($)": [7.50, 15.00, 9.25, 4.50]
    }
    df_demo = pd.DataFrame(data)
    st.dataframe(df_demo, use_container_width=True)
