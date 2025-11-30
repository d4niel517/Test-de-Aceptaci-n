Feature: US13 - Gestión de Prioridad en Recolecciones
    Como usuario (bodega o joven eco-consciente),
    Quiero marcar ciertas recolecciones como prioritarias,
    Para visualizarlas rápidamente y atenderlas con mayor urgencia.

Scenario Outline: Asignación exitosa de prioridad
    Dado que el <usuario> se encuentra en el apartado <Home> y visualiza la lista de recolecciones en <Entregas_y_Recojos>
    Cuando presione el ícono <Priorizar> en una <recoleccion_pendiente>
    Entonces el sistema deberá resaltar la solicitud seleccionada con un <color_distintivo>

    Examples: Datos de entrada
        | usuario                               | Home              | Entregas_y_Recojos    | Priorizar             | recoleccion_pendiente     |
        | bodega.ecomart@email.com (Bodega)     | "Pantalla Home"   | [Lista de solicitudes]| [Ícono de Estrella]   | [Recolección #101]        |
        | jsm0502@gmail.com (Eco-consciente)    | "Pantalla Home"   | [Lista de solicitudes]| [Ícono de Bandera]    | [Recolección #105]        |

    Examples: Datos de salida
        | color_distintivo                                      |
        | [Fondo amarillo / Ícono activado]                     |
        | [Borde rojo / Ícono activado]                         |

Scenario Outline: Despriorización de una recolección previamente marcada
    Dado que el <usuario> se encuentra en el apartado <Home> y visualiza la lista de <Entregas_y_Recojos>
    Cuando seleccione una <recoleccion_prioritaria> y presione nuevamente el botón <Priorizar>
    Entonces el sistema interpretará la acción como una <despriorizacion> y eliminará el <color_distintivo>

    Examples: Datos de entrada
        | usuario                   | Home            | Entregas_y_Recojos    | recoleccion_prioritaria           | Priorizar             |
        | bodega.ecomart@email.com  | "Pantalla Home" | [Lista de solicitudes]| [Recolección #101 (Marcada)]      | [Click para desmarcar]|
        | jsm0502@gmail.com         | "Pantalla Home" | [Lista de solicitudes]| [Recolección #105 (Marcada)]      | [Click para desmarcar]|

    Examples: Datos de salida
        | despriorizacion                   | color_distintivo                          |
        | "Acción completada exitosamente"  | [Eliminado del registro visual / Normal]  |
        | "Acción completada exitosamente"  | [Eliminado del registro visual / Normal]  |
