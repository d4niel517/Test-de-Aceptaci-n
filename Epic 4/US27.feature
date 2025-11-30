Feature: US27 - Filtros por material y tipo de punto
    Como joven eco-consciente,
    Quiero filtrar los puntos de recolección por material y tipo de punto,
    Para planificar rutas más específicas.

Scenario Outline: Filtrar por tipo de material
    Dado que el <usuario_autenticado> se encuentre en la sección "Search" con el <mapa_visible> y la <lista_de_puntos_completa>
    Cuando realiza la <accion_marcar_casilla> en los <filtros_material>
    Entonces el sistema deberá mostrar el <mapa_actualizado> con los <iconos_filtrados_material>

    Examples: Datos de entrada
        | usuario_autenticado                   | mapa_visible                | lista_de_puntos_completa | accion_marcar_casilla         | filtros_material   |
        | jsm0502@gmail.com (Eco-consciente)    | [Mapa con todos los puntos] | [BD: Plástico, Vidrio...] | [Check en "Plástico"]         | "Tipo de Material" |
        | ana.perez@email.com (Eco-consciente)  | [Mapa con todos los puntos] | [BD: Plástico, Vidrio...] | [Check en "Vidrio" y "Papel"] | "Tipo de Material" |

    Examples: Datos de salida
        | mapa_actualizado      | iconos_filtrados_material             |
        | [Mapa refrescado]     | [Solo puntos que aceptan Plástico]    |
        | [Mapa refrescado]     | [Solo puntos que aceptan Vidrio/Papel]|

Scenario Outline: Filtrar por tipo de punto
    Dado que el <usuario_autenticado> está en el <mapa_visible> con la <lista_de_puntos>
    Cuando realiza la <accion_seleccionar_tipo> en los <filtros_tipo_punto>
    Entonces el sistema deberá mostrar el <mapa_actualizado> con los <iconos_filtrados_tipo>

    Examples: Datos de entrada
        | usuario_autenticado   | mapa_visible  | lista_de_puntos   | accion_seleccionar_tipo       | filtros_tipo_punto |
        | jsm0502@gmail.com     | [Mapa actual] | [Datos cargados]  | [Click en "Comercio/Bodega"]  | "Tipo de Punto"    |
        | ana.perez@email.com   | [Mapa actual] | [Datos cargados]  | [Click en "Reciclador"]       | "Tipo de Punto"    |

    Examples: Datos de salida
        | mapa_actualizado      | iconos_filtrados_tipo                 |
        | [Mapa refrescado]     | [Solo íconos de Bodegas]              |
        | [Mapa refrescado]     | [Solo íconos de Recicladores]         |
