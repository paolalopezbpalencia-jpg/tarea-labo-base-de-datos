import streamlit as st
from config.conexion import obtener_conexion

def mostrar_inventario():
    st.header("Inventario de Productos")
    conexion = None
    cursor = None
    try:
        conexion = obtener_conexion()
        if conexion is None:
            return
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM INVENTARIO")
        registros = cursor.fetchall()
        
        if not registros:
            st.info("No hay productos registrados en el inventario.")
        else:
            st.table(registros)
    except Exception as error:
        st.error(f"Error al cargar el inventario: {error}")
    finally:
        if cursor is not None:
            cursor.close()
        if conexion is not None and conexion.is_connected():
            conexion.close()
