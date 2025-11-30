Feature: US08 - Gestión de Recolecciones (Reprogramación)
    Como bodega o pequeño negocio,
    Quiero poder modificar la fecha y hora de una recolección,
    Para ajustar la logística ante imprevistos.

Scenario Outline: Reprogramación exitosa de fecha y hora de recolección
    Dado que la <bodega> tiene una <recoleccion_registrada>
    Cuando acceda a <Entregas_y_recojos>, seleccione <Editar> y coloque una nueva <fecha> y <hora> válidas
    Entonces el sistema deberá actualizar la programación y mostrar el mensaje <reprogramacion_exitosa>

    Examples: Datos de entrada
        | bodega                                | recoleccion_registrada    | Entregas_y_recojos    | Editar            | fecha        | hora    |
        | bodega.ecomart@email.com (Bodega)     | [ID: 101 - Pendiente]     | "Entregas y Recojos"  | [Botón Editar]    | "25/11/2025" | "14:00" |
        | tienda.pepe@email.com (Bodega)        | [ID: 102 - Pendiente]     | "Entregas y Recojos"  | [Botón Editar]    | "30/11/2025" | "10:00" |

    Examples: Datos de salida
        | reprogramacion_exitosa                |
        | "Recolección reprogramada con éxito"  |
        | "Recolección reprogramada con éxito"  |

Scenario Outline: Reprogramación inválida (Fecha/Hora incorrecta)
    Dado que la <bodega> se encuentra en el apartado <Editar>
    Cuando coloque una <fecha> o <hora> no válida
    Entonces el sistema rechazará la programación y mostrará el mensaje <mensaje_error_fecha_hora_invalida>

    Examples: Datos de entrada
        | bodega                    | Editar            | fecha         | hora    |
        | bodega.ecomart@email.com  | [Pantalla Editar] | "01/01/2020"  | "14:00" |
        | tienda.pepe@email.com     | [Pantalla Editar] | "25/11/2025"  | "25:00" |

    Examples: Datos de salida
        | mensaje_error_fecha_hora_invalida |
        | "Fecha y hora inválidas"          |
        | "Fecha y hora inválidas"          |
