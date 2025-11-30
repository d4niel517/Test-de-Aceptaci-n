Feature: US32 - Visualizar detalles de la ruta generada
    Como joven eco-consciente,
    Quiero visualizar la distancia total y el tiempo estimado de recorrido de mi ruta,
    Para poder organizar mejor mi jornada de reciclaje.

Scenario Outline: Mostrar resumen de la ruta generada
    Dado que el <usuario_autenticado> tiene una <ruta_optima_generada> visible y el sistema tiene los <datos_ruta_calculados>
    Cuando el sistema muestra la trayectoria
    Entonces deberá desplegar un <panel_flotante_resumen> con la <info_resumen_ruta> y un <boton_ver_mapa_completo>

    Examples: Datos de entrada
        | usuario_autenticado                   | ruta_optima_generada      | datos_ruta_calculados                         |
        | jsm0502@gmail.com (Eco-consciente)    | [Ruta visualizada en mapa]| {Distancia: "5km", Tiempo: "30min", Ptos: 3}  |
        | ana.perez@email.com (Eco-consciente)  | [Ruta visualizada en mapa]| {Distancia: "2.5km", Tiempo: "15min", Ptos: 2}|

    Examples: Datos de salida
        | panel_flotante_resumen    | info_resumen_ruta                                     | boton_ver_mapa_completo   |
        | [Recuadro visible]        | "5km - 30min - 3 puntos. Orden: 1. A, 2. B, 3. C"     | [Botón Centrar Mapa]      |
        | [Recuadro visible]        | "2.5km - 15min - 2 puntos. Orden: 1. X, 2. Y"         | [Botón Centrar Mapa]      |

Scenario Outline: Actualización automática de detalles
    Dado que el <usuario_autenticado> está viendo la <ruta_optima_generada>
    Cuando realiza una <accion_modificar_ruta> (ej. <nuevo_punto_agregado>)
    Entonces el sistema deberá mostrar la <ruta_actualizada_mapa> y el <panel_flotante_actualizado> con la <info_resumen_recalculada>

    Examples: Datos de entrada
        | usuario_autenticado   | ruta_optima_generada  | accion_modificar_ruta | nuevo_punto_agregado  |
        | jsm0502@gmail.com     | [Ruta actual]         | [Agregar punto]       | "Punto D"             |
        | ana.perez@email.com   | [Ruta actual]         | [Eliminar punto]      | "Punto X"             |

    Examples: Datos de salida
        | ruta_actualizada_mapa | panel_flotante_actualizado    | info_resumen_recalculada              |
        | [Línea visual extendida]| [Recuadro refrescado]       | "Distancia y tiempo aumentados"       |
        | [Línea visual reducida] | [Recuadro refrescado]       | "Distancia y tiempo reducidos"        |
