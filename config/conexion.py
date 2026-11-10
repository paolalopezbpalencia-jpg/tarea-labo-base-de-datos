import mysql.connector
import streamlit as st

def obtener_conexion():
    try:
        conexion = mysql.connector.connect(
            host="PEGA_AQUÍ_TU_HOST",       # Ej: "localhost" o la IP/URL de tu BD
            port=3306,                      # Puerto de MySQL
            user="PEGA_AQUÍ_TU_USUARIO",    # Ej: "root"
            password="PEGA_AQUÍ_TU_CLAVE",  # Tu contraseña
            database="PEGA_AQUÍ_EL_NOMBRE_DE_TU_BASE" # Nombre de tu base de datos
        )
        return conexion
    except mysql.connector.Error as error:
        st.error(f"Error al conectar con la base de datos: {error}")
        return None
