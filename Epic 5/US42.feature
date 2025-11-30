Feature: US42 - Descripción del perfil
    Como joven eco-consciente o bodega,
    Quiero añadir una breve descripción sobre mí o mi negocio (texto o imágenes),
    Para que el resto de usuarios conozca mejor mi negocio y/o a mí.

Scenario Outline: Añadir descripción al perfil
    Dado que el <usuario_autenticado> está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y la <accion_ingresar_descripcion>
    Entonces el sistema habilita el <campo_texto_descripcion_habilitado>
    Y cuando el usuario ingresa el <texto_descripcion> y realiza la <accion_presionar_icono_mas>
    Entonces el sistema abre el <selector_de_archivos_abierto> para subir <imagenes_seleccionadas>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_mi_perfil     | accion_presionar_modificar | accion_ingresar_descripcion | texto_descripcion             | accion_presionar_icono_mas | imagenes_seleccionadas |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Descripción"]    | "Me gusta reciclar vidrio..." | [Click en ícono "+"]       | "foto_reciclaje.jpg"   |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Descripción"]    | "Bodega comprometida con..."  | [Click en ícono "+"]       | "foto_fachada.jpg"     |

    Examples: Datos de salida
        | campo_texto_descripcion_habilitado    | selector_de_archivos_abierto          |
        | [Caja de texto activa]                | [Ventana de selección de archivos]    |
        | [Caja de texto activa]                | [Ventana de selección de archivos]    |

Scenario Outline: Editar o eliminar descripción
    Dado que el <usuario_autenticado> (con <descripcion_actual>) está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y la <accion_ingresar_descripcion>
    Entonces el sistema habilita el <campo_texto_descripcion_editable> y muestra las <opciones_eliminar_imagen>

    Examples: Datos de entrada
        | usuario_autenticado   | descripcion_actual            | seccion_mi_perfil     | accion_presionar_modificar | accion_ingresar_descripcion |
        | jsm0502@gmail.com     | "Texto antiguo..." + [Foto A] | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Descripción"]    |
        | bodega.ecomart        | "Texto antiguo..." + [Foto B] | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en "Descripción"]    |

    Examples: Datos de salida
        | campo_texto_descripcion_editable      | opciones_eliminar_imagen              |
        | [Caja de texto editable]              | [Botón "X" sobre la imagen]           |
        | [Caja de texto editable]              | [Botón "X" sobre la imagen]           |
