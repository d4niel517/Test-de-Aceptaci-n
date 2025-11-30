Feature: US45 - Consultar historial de actividades
    Como bodega,
    Quiero revisar el historial de actividades,
    Para llevar control de mis entregas y acciones.

Scenario Outline: Visualizar historial de actividades
    Dado que la bodega <usuario_autenticado> está en el <apartado_mi_perfil> y tiene <datos_historial_completos>
    Cuando realiza la <accion_seleccionar_historial> e ingresa un <rango_fechas_ingresado> usando el <selector_rango_fechas>
    Entonces la app muestra la <lista_transacciones_filtrada_fecha> donde cada <detalle_item_historial> es visible

    Examples: Datos de entrada
        | usuario_autenticado                   | apartado_mi_perfil    | datos_historial_completos     | accion_seleccionar_historial  | selector_rango_fechas | rango_fechas_ingresado    |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   | [BD: Transacciones 2024]      | [Click "Historial Actividades"]| [Calendario]          | "01/11/2024 - 30/11/2024" |
        | tienda.pepe@email.com (Bodega)        | "Sección Mi Perfil"   | [BD: Transacciones 2024]      | [Click "Historial Actividades"]| [Calendario]          | "15/10/2024 - 15/11/2024" |

    Examples: Datos de salida
        | lista_transacciones_filtrada_fecha    | detalle_item_historial                |
        | [Lista visual de actividades]         | "Fecha, Material, Peso y Estado"      |
        | [Lista visual de actividades]         | "Fecha, Material, Peso y Estado"      |

Scenario Outline: Buscar transacciones y recolecciones específicas
    Dado que el <usuario_autenticado> está en la <pestaña_historial_actividades>
    Cuando usa los <controles_filtro> para ingresar <filtros_seleccionados> y realiza la <accion_presionar_icono_filtro>
    Entonces la aplicación muestra la <lista_transacciones_filtrada>

    Examples: Datos de entrada
        | usuario_autenticado   | pestaña_historial_actividades | controles_filtro              | filtros_seleccionados     | accion_presionar_icono_filtro |
        | bodega.ecomart        | "Pantalla Historial"          | [Dropdown Material / Estado]  | "Plástico" y "Completado" | [Click en Filtrar]            |
        | tienda.pepe           | "Pantalla Historial"          | [Dropdown Material / Estado]  | "Vidrio" y "Pendiente"    | [Click en Filtrar]            |

    Examples: Datos de salida
        | lista_transacciones_filtrada                                  |
        | [Lista actualizada: Solo ítems de Plástico Completados]       |
        | [Lista actualizada: Solo ítems de Vidrio Pendientes]          |
