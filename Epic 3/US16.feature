Feature: US16 - Canje de recompensas (Incentivos)
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero canjear mis puntos por beneficios o descuentos en comercios aliados,
    Para sentir que mi esfuerzo tiene una recompensa tangible.

Scenario Outline: Visualización del catálogo de beneficios en Incentivos
    Dado que el <usuario> se encuentre en su perfil y tenga <puntos_acumulados>
    Cuando acceda al apartado <Incentivos>
    Entonces el sistema mostrará un <catalogo_de_beneficios> con nombre, costo en puntos, descripción y disponibilidad

    Examples: Datos de entrada
        | usuario                               | puntos_acumulados | Incentivos            |
        | jsm0502@gmail.com (Eco-consciente)    | 500 Puntos        | [Sección Recompensas] |
        | bodega.ecomart@email.com (Bodega)     | 1200 Puntos       | [Sección Recompensas] |

    Examples: Datos de salida
        | catalogo_de_beneficios                                                |
        | [Lista: "Vale de S/20 (200 pts)", "Descuento 10% (100 pts)"]          |
        | [Lista: "Publicidad destacada (1000 pts)", "Insumos gratis (500 pts)"]|

Scenario Outline: Canje de un beneficio del catálogo
    Dado que el <usuario> seleccione un <beneficio> dentro del <catalogo>
    Cuando presione el botón <Canjear> y confirme la acción
    Entonces el sistema descontará automáticamente los <puntos_del_saldo>, registrará el canje y mostrará el <mensaje_canje_exitoso>

    Examples: Datos de entrada
        | usuario                   | beneficio                     | catalogo              | Canjear             | puntos_del_saldo |
        | jsm0502@gmail.com         | "Vale de consumo S/20"        | [Catálogo visible]    | [Click en Canjear]  | 200              |
        | bodega.ecomart@email.com  | "Pack de bolsas reciclables"  | [Catálogo visible]    | [Click en Canjear]  | 150              |

    Examples: Datos de salida
        | mensaje_canje_exitoso         |
        | "Canje realizado con éxito."  |
        | "Canje realizado con éxito."  |
