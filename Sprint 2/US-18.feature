Feature: US18 - Tienda de puntos
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero acceder a una tienda de puntos donde pueda canjear mis puntos por diferentes beneficios digitales,
    Para mantenerme motivado a reciclar y aprovechar recompensas exclusivas.

Scenario Outline: Visualización de la Tienda de puntos
    Dado que el <usuario> acceda a la sección <Incentivos>
    Cuando seleccione la opción <Tienda_de_puntos>
    Entonces el sistema deberá mostrar un <catalogo_de_beneficios> con nombre, ícono, descripción breve y costo en puntos

    Examples: Datos de entrada
        | usuario                               | Incentivos            | Tienda_de_puntos      |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Incentivos"  | [Opción Tienda]       |
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | [Opción Tienda]       |

    Examples: Datos de salida
        | catalogo_de_beneficios                                                    |
        | [Lista: "Ebook Reciclaje (50 pts)", "Fondo de pantalla (10 pts)"]        |
        | [Lista: "Banner publicitario (500 pts)", "Destacado en mapa (300 pts)"]  |

Scenario Outline: Canje en la Tienda de puntos
    Dado que el <usuario> acceda a <Incentivos> y tenga suficientes <puntos_acumulados>
    Cuando seleccione un <beneficio> y presione <Canjear>
    Entonces el sistema descontará automáticamente los <puntos_del_saldo>
    Y registrará la <transaccion_en_historial> y mostrará el <mensaje_canje_exitoso>

    Examples: Datos de entrada
        | usuario                   | Incentivos            | puntos_acumulados | beneficio             | Canjear           |
        | jsm0502@gmail.com         | "Sección Incentivos"  | 100 Puntos        | "Ebook Reciclaje"     | [Click Canjear]   |
        | bodega.ecomart@email.com  | "Sección Incentivos"  | 1000 Puntos       | "Banner publicitario" | [Click Canjear]   |

    Examples: Datos de salida
        | puntos_del_saldo  | transaccion_en_historial          | mensaje_canje_exitoso         |
        | 50 Puntos         | [Historial: -50 pts por Ebook]    | "Canje realizado con éxito."  |
        | 500 Puntos        | [Historial: -500 pts por Banner]  | "Canje realizado con éxito."  |
