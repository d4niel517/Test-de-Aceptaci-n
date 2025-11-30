Feature: US14 - Interacción y Calificación del Recolector
    Como bodega o joven eco-consciente,
    Quiero poder conversar con el recolector y calificar su servicio,
    Para asegurar una recolección coordinada y de calidad.

Scenario Outline: Visualización de jóvenes eco-conscientes disponibles (Chat)
    Dado que el <usuario> tiene materiales registrados y se encuentra en el apartado <Home>
    Cuando el sistema detecte que ya tiene un <recolector_asignado>
    Entonces el sistema mostrará el icono de <chat_disponible>
    Y cuando el usuario presione dicho icono, se habilitará el <chat_abierto>

    Examples: Datos de entrada
        | usuario                               | Home              | recolector_asignado   | chat_disponible           |
        | bodega.ecomart@email.com (Bodega)     | "Pantalla Home"   | "Juan Silva"          | [Icono de Chat visible]   |
        | jsm0502@gmail.com (Eco-consciente)    | "Pantalla Home"   | "Bodega Pepe"         | [Icono de Chat visible]   |

    Examples: Datos de salida
        | chat_abierto                                      |
        | [Ventana de conversación activa con Juan Silva]   |
        | [Ventana de conversación activa con Bodega Pepe]  |

Scenario Outline: Confirmación y calificación del recolector después de la recolección
    Dado que el <usuario> se encuentra en <Home> y aparece la <notificacion_confirmacion>
    Cuando califique al recolector usando <estrellas_calificacion> y presione los botones <Enviar> u <Omitir>
    Entonces el sistema mostrará el mensaje <calificacion_enviada> o <calificacion_omitida>

    Examples: Datos de entrada (Enviar)
        | usuario                   | Home            | notificacion_confirmacion | estrellas_calificacion | Enviar             | Omitir |
        | bodega.ecomart            | "Pantalla Home" | [Alerta: Recojo listo]    | "5 Estrellas"          | [Click en Enviar]  | N/A    |

    Examples: Datos de salida (Enviar)
        | calificacion_enviada                          | calificacion_omitida |
        | "Calificación registrada exitosamente"        | N/A                  |

    Examples: Datos de entrada (Omitir)
        | usuario                   | Home            | notificacion_confirmacion | estrellas_calificacion | Enviar | Omitir             |
        | jsm0502                   | "Pantalla Home" | [Alerta: Recojo listo]    | N/A                    | N/A    | [Click en Omitir]  |

    Examples: Datos de salida (Omitir)
        | calificacion_enviada | calificacion_omitida                   |
        | N/A                  | "Se omitió la calificación"            |
