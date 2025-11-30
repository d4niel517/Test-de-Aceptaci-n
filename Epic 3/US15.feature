Feature: US15 - Sistema de puntos por reciclaje
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero acumular puntos digitales por cada entrega de residuos,
    Para motivarme a reciclar de forma continua.

Scenario Outline: Consulta de puntos acumulados
    Dado que el <usuario> desea consultar sus puntos acumulados
    Cuando ingrese a <Mi_Perfil>
    Entonces el sistema mostrará el total de <puntos_acumulados> y el porcentaje de avance hacia la <meta_mensual>
    Y mostrará el mensaje contextual <Ciudadano_activo_desde>

    Examples: Datos de entrada
        | usuario                               | Mi_Perfil             |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Mi Perfil"   |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   |

    Examples: Datos de salida
        | puntos_acumulados | meta_mensual              | Ciudadano_activo_desde            |
        | "1200 Puntos"     | "60% de la meta mensual"  | "Ciudadano activo desde Ene 2024" |
        | "8500 Puntos"     | "85% de la meta mensual"  | "Bodega activa desde Mar 2023"    |

Scenario Outline: Actualización automática de puntos por entrega
    Dado que el <usuario> registre <materiales_reciclables>
    Cuando la <bodega> confirme la entrega y se complete la acción
    Entonces el sistema calculará los <puntos_correspondientes> según tipo y cantidad
    Y los sumará al <saldo_de_puntos>

    Examples: Datos de entrada
        | usuario           | materiales_reciclables    | bodega            |
        | jsm0502@gmail.com | "5kg de Plástico"         | "Bodega EcoMart"  |
        | ana.perez@mail.com| "10kg de Vidrio"          | "Tienda Pepe"     |

    Examples: Datos de salida
        | puntos_correspondientes   | saldo_de_puntos                   |
        | "50 Puntos"               | "Saldo actualizado: 1250 Puntos"  |
        | "100 Puntos"              | "Saldo actualizado: 500 Puntos"   |
