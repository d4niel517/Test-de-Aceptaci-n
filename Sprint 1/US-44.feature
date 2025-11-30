Feature: US44 - Visualizar reporte de actividades de mi perfil
    Como joven eco-consciente o bodega,
    Quiero ver estadísticas de mi historial de acciones realizadas dentro de la app.

Scenario Outline: Visualizar estadísticas generales del perfil
    Dado que el <usuario_autenticado> (ej. <nombre_usuario>) tiene <datos_estadisticas_basicas>
    Cuando realiza la <accion_cargar_home> y se dirige a la <pestaña_home>
    Entonces el sistema mostrara el <reporte_superior_visible> con el <mensaje_saludo>, el <titulo_seccion> y el <resumen_acciones_basico>

    Examples: Datos de entrada
        | usuario_autenticado                   | nombre_usuario | datos_estadisticas_basicas        | accion_cargar_home    | pestaña_home      |
        | jsm0502@gmail.com (Eco-consciente)    | "Luis"         | {Puntos: 500, Entregas: 10}       | [Abrir App / Home]    | "Pantalla Home"   |
        | bodega.ecomart@email.com (Bodega)     | "EcoMart"      | {Puntos: 1500, Recolecciones: 50} | [Abrir App / Home]    | "Pantalla Home"   |

    Examples: Datos de salida
        | reporte_superior_visible  | mensaje_saludo    | titulo_seccion            | resumen_acciones_basico       |
        | [Sección Superior Home]   | "Hola, Luis"      | "Estadísticas del perfil" | "500 Puntos | 10 Entregas"    |
        | [Sección Superior Home]   | "Hola, EcoMart"   | "Estadísticas del perfil" | "1500 Puntos | 50 Recojos"    |

Scenario Outline: Ver estadísticas avanzadas del perfil
    Dado que el <usuario_autenticado> tiene <datos_estadisticas_avanzadas>
    Cuando se dirige a la <seccion_estadisticas_perfil> e realiza la <accion_ingresar_estadisticas>
    Entonces el sistema mostrara la <pantalla_estadisticas_avanzadas> con <detalle_puntos_obtenidos>, <detalle_entregas_recojos>, <detalle_publicaciones_hechas>, <detalle_tiempo_uso> y <detalle_rango_usuario>

    Examples: Datos de entrada
        | usuario_autenticado   | datos_estadisticas_avanzadas                                          | seccion_estadisticas_perfil   | accion_ingresar_estadisticas  |
        | jsm0502@gmail.com     | {Pts: 1200, Ent: 15, Posts: 5, Tiempo: 20h, Rango: "Eco-Guardián"}    | "Estadísticas del perfil"     | [Click en Sección]            |
        | bodega.ecomart        | {Pts: 5000, Rec: 100, Posts: 12, Tiempo: 50h, Rango: "Socio Oro"}     | "Estadísticas del perfil"     | [Click en Sección]            |

    Examples: Datos de salida
        | pantalla_estadisticas_avanzadas   | detalle_puntos_obtenidos | detalle_entregas_recojos | detalle_publicaciones_hechas | detalle_tiempo_uso | detalle_rango_usuario |
        | [Vista Detallada]                 | "1200 Puntos Totales"    | "15 Entregas realizadas" | "5 Publicaciones"            | "20 Horas de uso"  | "Rango: Eco-Guardián" |
        | [Vista Detallada]                 | "5000 Puntos Totales"    | "100 Recojos realizados" | "12 Publicaciones"           | "50 Horas de uso"  | "Rango: Socio Oro"    |
