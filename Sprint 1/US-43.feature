Feature: US43 - Consultar historial de materiales recibidos o entregados
    Como joven-eco-consciente o bodega,
    Quiero visualizar un historial estadístico general sobre los materiales reciclados,
    Para llevar un control de mis acciones.

Scenario Outline: Visualizar cantidad materiales reciclados
    Dado que el <usuario_autenticado> quiere ver su historial y tiene <datos_historial_6_meses>
    Cuando se dirige a la <pestaña_home> y visualiza la <opcion_reciclaje_por_mes> mediante la <accion_visualizar_opcion>
    Entonces el sistema mostrará un <grafico_area_visible> con los <datos_graficados_area>

    Examples: Datos de entrada
        | usuario_autenticado                   | pestaña_home      | opcion_reciclaje_por_mes  | accion_visualizar_opcion  | datos_historial_6_meses       |
        | jsm0502@gmail.com (Eco-consciente)    | "Pantalla Home"   | "Reciclaje por mes"       | [Scroll / Click]          | [BD: Historial Jun-Nov]       |
        | bodega.ecomart@email.com (Bodega)     | "Pantalla Home"   | "Reciclaje por mes"       | [Scroll / Click]          | [BD: Historial Jun-Nov]       |

    Examples: Datos de salida
        | grafico_area_visible      | datos_graficados_area                                 |
        | [Gráfico de Área]         | [Visualización de cantidad total reciclada mes a mes] |
        | [Gráfico de Área]         | [Visualización de cantidad total reciclada mes a mes] |

Scenario Outline: Visualizar tipos de materiales reciclados
    Dado que el <usuario_autenticado> está en la <pestaña_home> y tiene <datos_mes_actual_por_tipo>
    Cuando realiza la <accion_visualizar_apartado> en el <apartado_distribucion_materiales>
    Entonces el sistema mostrará un <grafico_rosca_visible> con su <leyenda_grafico_rosca>

    Examples: Datos de entrada
        | usuario_autenticado   | pestaña_home      | apartado_distribucion_materiales  | accion_visualizar_apartado | datos_mes_actual_por_tipo     |
        | jsm0502@gmail.com     | "Pantalla Home"   | "Distribución de materiales"      | [Scroll / Click]           | {Plástico: 30%, Papel: 70%}   |
        | bodega.ecomart        | "Pantalla Home"   | "Distribución de materiales"      | [Scroll / Click]           | {Vidrio: 50%, Metal: 50%}     |

    Examples: Datos de salida
        | grafico_rosca_visible     | leyenda_grafico_rosca                                     |
        | [Gráfico Donut Chart]     | [Categorías y porcentajes correspondientes al mes actual] |
        | [Gráfico Donut Chart]     | [Categorías y porcentajes correspondientes al mes actual] |
