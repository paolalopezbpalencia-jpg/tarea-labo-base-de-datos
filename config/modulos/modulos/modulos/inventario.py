import streamlit as st
from config.conexion import obtener_conexion

def mostrar_inventario():
    st.header("Control de Inventario")

    with st.form("form_inventario"):
        producto = st.text_input("Nombre del producto")
        cantidad = st.number_input("Cantidad disponible", min_value=1, step=1)
        ubicacion = st.text_input("Ubicación en bodega")
        guardar = st.form_submit_button("Registrar inventario")

        if guardar:
            if producto.strip() == "" or ubicacion.strip() == "":
                st.warning("Debe ingresar el producto y su ubicación.")
            else:
                conexion = None
                cursor = None
                try:
                    conexion = obtener_conexion()
                    if conexion is None:
                        return
                    cursor = conexion.cursor()
                    consulta = "INSERT INTO inventario (Producto, Cantidad, Ubicacion) VALUES (%s, %s, %s)"
                    cursor.execute(consulta, (producto, int(cantidad), ubicacion))
                    conexion.commit()
                    st.success("Registro de inventario guardado correctamente.")
                except Exception as error:
                    if conexion is not None:
                        conexion.rollback()
                    st.error(f"Error al registrar inventario: {error}")
                finally:
                    if cursor is not None:
                        cursor.close()
                    if conexion is not None and conexion.is_connected():
                        conexion.close()
