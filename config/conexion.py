import mysql.connector
import streamlit as st

def obtener_conexion():
    try:
        conexion = mysql.connector.connect(
            host="localhost",         # O la IP de tu servidor de base de datos
            port=3306,
            user="root",              # Tu usuario de MySQL
            password="tu_password",   # Tu contraseña de MySQL
            database="nombre_de_tu_base" # El nombre de tu base de datos
        )
        return conexion
    except mysql.connector.Error as error:
        st.error(f"Error al conectar con la base de datos: {error}")
        return None
