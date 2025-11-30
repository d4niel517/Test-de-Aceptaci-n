Feature: US50 - Contacto telefónico con soporte
    Como joven eco-consciente o dueño de bodega,
    Quiero poder comunicarme directamente por teléfono con el área de soporte,
    Para recibir asistencia inmediata ante problemas urgentes o dudas específicas.

Scenario Outline: Llamada exitosa al soporte
    Dado que el <usuario_autenticado> se encuentra en el <apartado_soporte_al_cliente>
    Cuando realiza la <accion_presionar_contacto>
    Entonces el sistema deberá mostrar el <numero_soporte_visible> y la <opcion_llamar_ahora_visible> (que inicia la <accion_iniciar_llamada>)

    Examples: Datos de entrada
        | usuario_autenticado                   | apartado_soporte_al_cliente   | accion_presionar_contacto     |
        | jsm0502@gmail.com (Eco-consciente)    | "Soporte al cliente"          | [Click en "Contacto"]         |
        | bodega.ecomart@email.com (Bodega)     | "Soporte al cliente"          | [Click en "Contacto"]         |

    Examples: Datos de salida
        | numero_soporte_visible    | opcion_llamar_ahora_visible   | accion_iniciar_llamada        |
        | "+51 999 888 777"         | [Botón "Llamar ahora"]        | [Sistema inicia marcación]    |
        | "+51 999 888 777"         | [Botón "Llamar ahora"]        | [Sistema inicia marcación]    |

Scenario Outline: Fallo o línea ocupada
    Dado que el <usuario_autenticado> intenta llamar
    Cuando realiza la <accion_presionar_llamar_ahora> y el sistema detecta un <evento_fallo_llamada>
    Entonces el sistema deberá mostrar un <mensaje_error_llamada>

    Examples: Datos de entrada
        | usuario_autenticado   | accion_presionar_llamar_ahora | evento_fallo_llamada  |
        | jsm0502@gmail.com     | [Click en "Llamar ahora"]     | "Línea ocupada"       |
        | bodega.ecomart        | [Click en "Llamar ahora"]     | "Fuera de servicio"   |

    Examples: Datos de salida
        | mensaje_error_llamada                                         |
        | "No pudimos completar la llamada. Inténtelo más tarde"        |
        | "No pudimos completar la llamada. Inténtelo más tarde"        |
