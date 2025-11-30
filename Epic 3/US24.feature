Feature: US24 - Detalle del valor de puntos por acción o material
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero visualizar el detalle del valor de puntos que puedo obtener por cada tipo de acción o material reciclado,
    Para entender claramente cómo se calculan mis recompensas y optimizar mis entregas.

Scenario Outline: Visualización del valor de puntos por tipo de material o acción
    Dado que el <usuario> acceda a la sección <Incentivos>
    Cuando seleccione el botón <Valor_de_puntos>
    Entonces el sistema deberá mostrar una <tabla_informativa> con el <valor_en_puntos> por tipo de acción o material y su descripción

    Examples: Datos de entrada
        | usuario                               | Incentivos            | Valor_de_puntos       |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Incentivos"  | [Botón "Ver valores"] |
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | [Botón "Ver valores"] |

    Examples: Datos de salida
        | tabla_informativa                                                         | valor_en_puntos                               |
        | [Tabla: Materiales y Acciones]                                            | "Plástico PET = 10 pts/kg, Vidrio = 8 pts/kg" |
        | [Tabla: Materiales y Acciones]                                            | "Completar desafío = 5 pts, Cartón = 5 pts/kg"|

Scenario Outline: Actualización automática de valores en el detalle
    Dado que la <plataforma> modifique los <valores_de_puntos> por política o campaña temporal
    Cuando el <usuario> consulte el apartado <Tienda_de_puntos> y seleccione el botón <Valor_de_puntos>
    Entonces el sistema deberá mostrar automáticamente los <valores_actualizados> acompañados de un <mensaje_contextual>

    Examples: Datos de entrada
        | plataforma            | valores_de_puntos     | usuario           | Tienda_de_puntos      | Valor_de_puntos   |
        | "Admin Sistema"       | "Campaña Verano"      | jsm0502@gmail.com | "Sección Tienda"      | [Click en Ver]    |
        | "Admin Sistema"       | "Ajuste Mensual"      | bodega.ecomart    | "Sección Tienda"      | [Click en Ver]    |

    Examples: Datos de salida
        | valores_actualizados              | mensaje_contextual                        |
        | "Plástico: 15 pts/kg (Subió)"     | "Puntajes actualizados por campaña verano"|
        | "Vidrio: 10 pts/kg (Ajustado)"    | "Puntajes actualizados al mes de octubre" |
