Feature: US34 - Seguimiento en tiempo real del recolector
    Como joven eco-consciente,
    Quiero poder visualizar la ubicación del recolector en tiempo real,
    Para preparar mis materiales y reducir el tiempo de espera.

Scenario Outline: Visualización del mapa en tiempo real
    Dado que el <usuario_autenticado> está en "Home" y accede al <apartado_entregas_recojos>
    Cuando realiza la <accion_ingresar_chat> al <chat_recolector_asignado>
    Entonces podrá visualizar en un <mapa_tiempo_real> el <icono_ubicacion_recolector> basado en <datos_ubicacion_recolector> y el <tiempo_estimado_llegada>

    Examples: Datos de entrada
        | usuario_autenticado                   | apartado_entregas_recojos | chat_recolector_asignado  | accion_ingresar_chat  | datos_ubicacion_recolector |
        | jsm0502@gmail.com (Eco-consciente)    | "Entregas y Recojos"      | "Chat con Juan Silva"     | [Click en Chat]       | [Coords GPS en movimiento] |
        | ana.perez@email.com (Eco-consciente)  | "Entregas y Recojos"      | "Chat con Reciclador Pro" | [Click en Chat]       | [Coords GPS en movimiento] |

    Examples: Datos de salida
        | mapa_tiempo_real          | icono_ubicacion_recolector    | tiempo_estimado_llegada |
        | [Mapa integrado en chat]  | [Pin de camión/moto]          | "Llega en 5 minutos"    |
        | [Mapa integrado en chat]  | [Pin de camión/moto]          | "Llega en 2 minutos"    |

Scenario Outline: Recolector cercano
    Dado que el <usuario_autenticado> está en "Home" y el sistema procesa los <datos_ubicacion_recolector> y la <direccion_recoleccion_usuario>
    Cuando el sistema dispara un <evento_proximidad_detectada>
    Entonces deberá mostrar un <mensaje_emergente_proximidad> con el <texto_mensaje>

    Examples: Datos de entrada
        | usuario_autenticado   | datos_ubicacion_recolector    | direccion_recoleccion_usuario | evento_proximidad_detectada |
        | jsm0502@gmail.com     | [GPS: A 400m del punto]       | "Av. Arequipa 123"            | [Trigger: Distancia < 500m] |
        | ana.perez@email.com   | [GPS: A 200m del punto]       | "Jr. Unión 456"               | [Trigger: Distancia < 500m] |

    Examples: Datos de salida
        | mensaje_emergente_proximidad  | texto_mensaje                                     |
        | [Notificación Push / Banner]  | "¡Alístate, tu recolector llegará en unos minutos!" |
        | [Notificación Push / Banner]  | "¡Alístate, tu recolector llegará en unos minutos!" |
