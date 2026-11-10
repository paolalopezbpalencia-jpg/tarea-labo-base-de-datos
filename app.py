import streamlit as st
from modulos.login import mostrar_login
from modulos.VENTAS import mostrar_venta
from modulos.inventario import mostrar_inventario

# Inicializar variables de sesión
if "autenticado" not in st.session_state:
    st.session_state["autenticado"] = False

# Comprobar si el usuario inició sesión
if st.session_state["autenticado"]:

    st.sidebar.title("Menú")
    st.sidebar.write("Usuario: Administrador")

    opciones = ["Ventas", "Inventario", "Información"]
    seleccion = st.sidebar.selectbox("Seleccione una opción", opciones)

    # Mostrar módulo de ventas
    if seleccion == "Ventas":
        mostrar_venta()

    # Mostrar módulo de inventario
    elif seleccion == "Inventario":
        mostrar_inventario()

    # Mostrar módulo de información
    elif seleccion == "Información":
        st.header("Información del sistema")
        st.write("Aplicación desarrollada para la Tarea de bases de datos.")

    # Cerrar sesión
    if st.sidebar.button("Cerrar sesión"):
        st.session_state["autenticado"] = False
        st.rerun()

else:
    # Si no hay sesión iniciada, mostrar login
    mostrar_login()
