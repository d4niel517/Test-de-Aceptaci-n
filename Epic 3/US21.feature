Feature: US21 - Historial de actividad e incentivos
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero visualizar un historial con todas mis entregas, puntos ganados, canjes y recompensas,
    Para llevar un control detallado de mi progreso dentro del sistema de incentivos.

Scenario Outline: Visualización del historial de incentivos
    Dado que el <usuario> desee revisar su actividad pasada
    Cuando acceda al apartado <Historial_de_actividad> dentro de la sección <Incentivos>
    Entonces el sistema deberá mostrar una <lista_cronologica> con las acciones realizadas
    Y mostrará detalles como <fecha>, <tipo_de_accion>, <puntos_ganados_o_gastados> y <saldo_final>

    Examples: Datos de entrada
        | usuario                               | Historial_de_actividad    | Incentivos            |
        | jsm0502@gmail.com (Eco-consciente)    | "Historial Puntos"        | "Sección Incentivos"  |
        | bodega.ecomart@email.com (Bodega)     | "Historial Puntos"        | "Sección Incentivos"  |

    Examples: Datos de salida
        | lista_cronologica         | fecha     | tipo_de_accion        | puntos_ganados_o_gastados | saldo_final   |
        | [Item 1, Item 2...]       | "20/11"   | "Canje de Vale"       | "-200 pts"                | "300 pts"     |
        | [Item 1, Item 2...]       | "19/11"   | "Entrega de material" | "+50 pts"                 | "1250 pts"    |

Scenario Outline: Filtro por tipo de acción
    Dado que el <usuario> se encuentre en el <historial_de_incentivos>
    Cuando seleccione un <filtro> (por ejemplo, "Canjes" o "Desafíos")
    Entonces el sistema deberá mostrar únicamente las <acciones_correspondientes> a ese tipo

    Examples: Datos de entrada
        | usuario                   | historial_de_incentivos   | filtro        |
        | jsm0502@gmail.com         | "Historial Puntos"        | "Canjes"      |
        | bodega.ecomart@email.com  | "Historial Puntos"        | "Desafíos"    |

    Examples: Datos de salida
        | acciones_correspondientes                                 |
        | [Lista filtrada: Solo muestra canjes realizados]          |
        | [Lista filtrada: Solo muestra desafíos completados]       |
