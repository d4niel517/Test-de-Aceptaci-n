Feature: US09 - Gestión de Recolecciones (Cancelación)
    Como bodega,
    Quiero poder cancelar una recolección programada,
    Para gestionar cambios imprevistos en mi disponibilidad.

Scenario Outline: Cancelación exitosa de recolección programada
    Dado que la <bodega> tiene una <recoleccion_programada>
    Cuando acceda a <Entregas_y_recojos>, presione la opción <Eliminar> y confirme con <Aceptar>
    Entonces el sistema eliminará la solicitud y mostrará el mensaje <cancelacion_exitosa>

    Examples: Datos de entrada
        | bodega                                | recoleccion_programada | Entregas_y_recojos   | Eliminar         | Aceptar              |
        | bodega.ecomart@email.com (Bodega)     | [ID: 201 - Pendiente]  | "Entregas y Recojos" | [Botón Eliminar] | [Click en Aceptar]   |
        | tienda.pepe@email.com (Bodega)        | [ID: 202 - Pendiente]  | "Entregas y Recojos" | [Botón Eliminar] | [Click en Aceptar]   |

    Examples: Datos de salida
        | cancelacion_exitosa               |
        | "Recolección cancelada con éxito" |
        | "Recolección cancelada con éxito" |

Scenario Outline: Notificación de cancelación al joven eco-consciente
    Dado que la <recoleccion_programada> fue cancelada por la <bodega>
    Entonces el sistema enviará una <notificacion> al <joven_eco_consciente> informando sobre la cancelación

    Examples: Datos de entrada
        | recoleccion_programada    | bodega                    | joven_eco_consciente  |
        | [ID: 201 - Cancelada]     | bodega.ecomart@email.com  | jsm0502@gmail.com     |
        | [ID: 202 - Cancelada]     | tienda.pepe@email.com     | ana.perez@email.com   |

    Examples: Datos de salida
        | notificacion                                                                 |
        | "Tu recolección #201 ha sido cancelada por la bodega. Revisa tu historial."  |
        | "Tu recolección #202 ha sido cancelada por la bodega. Revisa tu historial."  |
