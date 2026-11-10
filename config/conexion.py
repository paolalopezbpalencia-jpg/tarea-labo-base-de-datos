import mysql.connector
import streamlit as st

def obtener_conexion():
    try:
        conexion = mysql.connector.connect(
            host="localhost",
            port=3306,
            user="root",
            password="tu_password",
            database="nombre_de_tu_base"
        )
        return conexion
    except mysql.connector.Error as error:
        # st.error(f"Error al conectar con la base de datos: {error}")
        return None
