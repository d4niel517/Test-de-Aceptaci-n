Feature: US11 - Calificación y Reputación del Recolector
    Como bodega o comercio,
    Quiero poder calificar el servicio de recolección recibido,
    Para contribuir a la reputación del joven eco-consciente y asegurar la calidad del servicio.

Scenario Outline: Visualización de la opción de calificación
    Dado que la <bodega> tenga una <recoleccion_completada>
    Cuando acceda al apartado <Historial_de_entregas> y seleccione una <entrega_finalizada>
    Entonces el sistema deberá mostrar la opción <Calificar_servicio> con estrellas (1 a 5) y campo de <comentarios>

    Examples: Datos de entrada
        | bodega                                | recoleccion_completada    | Historial_de_entregas | entrega_finalizada    |
        | bodega.ecomart@email.com (Bodega)     | [Estado: Finalizado]      | "Historial de Entregas" | [Entrega #501 - Plástico] |
        | tienda.pepe@email.com (Bodega)        | [Estado: Finalizado]      | "Historial de Entregas" | [Entrega #502 - Vidrio]   |

    Examples: Datos de salida
        | Calificar_servicio                                        | comentarios           |
        | [Interfaz de votación: ⭐⭐⭐⭐⭐]                        | [Campo de texto libre]|
        | [Interfaz de votación: ⭐⭐⭐⭐⭐]                        | [Campo de texto libre]|

Scenario Outline: Registro y actualización de la calificación
    Dado que la <bodega> establezca la <calificacion> y los <comentarios>
    Cuando presione el botón <Guardar_calificacion>
    Entonces el sistema registrará la evaluación y mostrará el <mensaje_calificacion_exitosa>
    Y actualizará el <perfil_del_joven_eco_consciente> con el nuevo <puntaje_promedio_recibido>

    Examples: Datos de entrada
        | bodega                    | calificacion | comentarios            | Guardar_calificacion |
        | bodega.ecomart@email.com  | 5 estrellas  | "Muy puntual y amable" | [Click en Guardar]   |
        | tienda.pepe@email.com     | 4 estrellas  | "Todo bien"            | [Click en Guardar]   |

    Examples: Datos de salida
        | mensaje_calificacion_exitosa      | perfil_del_joven_eco_consciente | puntaje_promedio_recibido |
        | "Calificación enviada con éxito." | [Perfil de Juan Silva]          | "4.9 Estrellas"           |
        | "Calificación enviada con éxito." | [Perfil de Ana Pérez]           | "4.5 Estrellas"           |
