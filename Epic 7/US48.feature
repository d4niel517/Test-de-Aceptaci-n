Feature: US48 - Centro de soporte (FAQ y contacto directo)
    Como joven eco-consciente o bodega,
    Quiero acceder a un centro de soporte con preguntas frecuentes (FAQ) y tener la opción de contactar a un asistente,
    Para resolver dudas o reportar problemas.

Scenario Outline: El usuario accede al centro de soporte (FAQ)
    Dado que el <usuario_autenticado> quiere respuestas rápidas
    Cuando se dirige a la <pestaña_soporte_al_cliente> y realiza la <accion_click_faq>
    Entonces la aplicación lo redirige a la <pantalla_faq_visible> y le muestra la <lista_preguntas_respuestas>

    Examples: Datos de entrada
        | usuario_autenticado                   | pestaña_soporte_al_cliente    | accion_click_faq          |
        | jsm0502@gmail.com (Eco-consciente)    | "Soporte al cliente"          | [Click en "FAQ"]          |
        | bodega.ecomart@email.com (Bodega)     | "Soporte al cliente"          | [Click en "Preguntas Frecuentes"] |

    Examples: Datos de salida
        | pantalla_faq_visible      | lista_preguntas_respuestas                                |
        | [Pantalla FAQ cargada]    | [Lista: "¿Cómo reciclar?", "¿Cómo ganar puntos?"]         |
        | [Pantalla FAQ cargada]    | [Lista: "¿Cómo programar recojo?", "¿Cómo canjear?"]      |

Scenario Outline: El usuario busca asistencia personalizada (Chat)
    Dado que el <usuario_autenticado> tiene una duda específica y se encuentra en la <pantalla_centro_soporte>
    Cuando presiona el botón <Soporte_24_7> (<accion_presionar_soporte_24_7>)
    Entonces se abre la <interfaz_chat_abierta> donde podrá ingresar su <descripcion_situacion> en el <campo_texto_chat_habilitado>
    Y luego el sistema muestra el <mensaje_espera_soporte>

    Examples: Datos de entrada
        | usuario_autenticado   | pantalla_centro_soporte   | Soporte_24_7          | accion_presionar_soporte_24_7 | descripcion_situacion |
        | jsm0502@gmail.com     | "Centro de Soporte"       | "Botón Chat 24/7"     | [Click en Chat]               | "Tengo un problema con..." |
        | bodega.ecomart        | "Centro de Soporte"       | "Botón Chat 24/7"     | [Click en Chat]               | "Necesito ayuda con..."    |

    Examples: Datos de salida
        | interfaz_chat_abierta     | campo_texto_chat_habilitado   | mensaje_espera_soporte                                    |
        | [Ventana de chat activa]  | [Caja de texto activa]        | "En breve, el área de soporte se contactará con usted."   |
        | [Ventana de chat activa]  | [Caja de texto activa]        | "En breve, el área de soporte se contactará con usted."   |
