import streamlit as st

def mostrar_login():
    st.title("Inicio de Sesión")
    usuario = st.text_input("Usuario")
    password = st.text_input("Contraseña", type="password")
    
    if st.button("Ingresar"):
        if usuario == "admin" and password == "1234":
            st.session_state["autenticado"] = True
            st.success("¡Bienvenido!")
            st.rerun()
        else:
            st.error("Usuario o contraseña incorrectos.")
