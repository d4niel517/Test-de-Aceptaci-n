Feature: US40 - Establecer foto de perfil
    Como joven eco-consciente o bodega,
    Quiero añadir una foto de perfil a mi cuenta.

Scenario Outline: Agregar foto de perfil
    Dado que el <usuario_autenticado> está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y luego la <accion_presionar_icono_mas>
    Entonces el sistema abre el <selector_de_archivos_abierto>
    Y cuando el usuario selecciona una <imagen_seleccionada>, se muestra la <foto_perfil_actualizada_visible>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_mi_perfil     | accion_presionar_modificar | accion_presionar_icono_mas | imagen_seleccionada   |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en ícono "+"]       | "foto_personal.jpg"   |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en ícono "+"]       | "logo_bodega.png"     |

    Examples: Datos de salida
        | selector_de_archivos_abierto          | foto_perfil_actualizada_visible       |
        | [Ventana de selección de archivos]    | [Vista previa de la nueva foto]       |
        | [Ventana de selección de archivos]    | [Vista previa de la nueva foto]       |

Scenario Outline: Eliminar foto de perfil
    Dado que el <usuario_autenticado> (con foto) está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y luego la <accion_presionar_eliminar_foto> (y confirma la <confirmacion_eliminacion>)
    Entonces la <foto_perfil_eliminada_bd> es borrada y se muestra la <foto_perfil_generica_visible>

    Examples: Datos de entrada
        | usuario_autenticado   | seccion_mi_perfil     | accion_presionar_modificar | accion_presionar_eliminar_foto    | confirmacion_eliminacion  |
        | jsm0502@gmail.com     | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Eliminar foto"]        | [Click en "Sí, borrar"]   |
        | bodega.ecomart        | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Eliminar foto"]        | [Click en "Sí, borrar"]   |

    Examples: Datos de salida
        | foto_perfil_eliminada_bd          | foto_perfil_generica_visible  |
        | [Referencia eliminada de la BD]   | [Avatar por defecto visible]  |
        | [Referencia eliminada de la BD]   | [Avatar por defecto visible]  |
