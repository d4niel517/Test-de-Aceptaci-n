Feature: US41 - Seleccionar tipo de cuenta
    Como joven eco-consciente o bodega,
    Quiero seleccionar un tipo de cuenta para que los usuarios conozcan mi rol dentro de la app.

Scenario Outline: Seleccionar tipo de cuenta
    Dado que el <usuario_autenticado> está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y la <accion_presionar_apartado_rol>
    Entonces el sistema muestra el <menu_desplegable_rol> con las <opciones_rol_visibles>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_mi_perfil     | accion_presionar_modificar    | accion_presionar_apartado_rol |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Mi Perfil"   | [Click en "Modificar"]        | [Click en apartado "Rol"]     |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   | [Click en "Modificar"]        | [Click en apartado "Rol"]     |

    Examples: Datos de salida
        | menu_desplegable_rol          | opciones_rol_visibles                                         |
        | [Interfaz Dropdown visible]   | ["Ciudadano eco-consciente", "Bodega/pequeño comercio"]       |
        | [Interfaz Dropdown visible]   | ["Ciudadano eco-consciente", "Bodega/pequeño comercio"]       |

Scenario Outline: Editar tipo de cuenta
    Dado que el <usuario_autenticado> (con <rol_actual>) está en la <seccion_mi_perfil>
    Cuando realiza la <accion_presionar_modificar> y la <accion_seleccionar_menu_rol>
    Entonces el sistema muestra el <menu_desplegable_rol_visible> con las <opciones_rol_reeleccion>

    Examples: Datos de entrada
        | usuario_autenticado   | rol_actual                | seccion_mi_perfil     | accion_presionar_modificar | accion_seleccionar_menu_rol   |
        | jsm0502@gmail.com     | "Ciudadano eco-consciente"| "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en menú desplegable]   |
        | bodega.ecomart        | "Bodega/pequeño comercio" | "Sección Mi Perfil"   | [Click en "Modificar"]     | [Click en menú desplegable]   |

    Examples: Datos de salida
        | menu_desplegable_rol_visible  | opciones_rol_reeleccion                                       |
        | [Menú se despliega]           | ["Ciudadano eco-consciente", "Bodega/pequeño comercio"]       |
        | [Menú se despliega]           | ["Ciudadano eco-consciente", "Bodega/pequeño comercio"]       |
