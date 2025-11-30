Feature: US49 - Abrir y gestionar reclamos con evidencia
    Como joven eco-consciente o bodega,
    Quiero abrir un reclamo en caso tenga un inconveniente,
    Para que el equipo de soporte pueda darme una solución.

Scenario Outline: Realizar un reclamo
    Dado que el <usuario_autenticado> está en el <apartado_24_7>
    Cuando realiza la <accion_iniciar_reclamo_manual> y adjunta <archivos_pruebas_adjuntos>
    Y realiza la <accion_enviar_reclamo> con una <descripcion_incidente>
    Entonces el sistema crea un <caso_creado_bd>, envía una <notificacion_equipo_soporte> y muestra el <mensaje_pendiente_revision>

    Examples: Datos de entrada
        | usuario_autenticado                   | apartado_24_7         | accion_iniciar_reclamo_manual | archivos_pruebas_adjuntos | descripcion_incidente             | accion_enviar_reclamo |
        | jsm0502@gmail.com (Eco-consciente)    | "Centro de Soporte"   | [Click en "Iniciar reclamo"]  | [foto_error_app.png]      | "La app se cierra al pagar"       | [Click en Enviar]     |
        | bodega.ecomart@email.com (Bodega)     | "Centro de Soporte"   | [Click en "Iniciar reclamo"]  | [foto_material.jpg]       | "El recolector no llevó todo"     | [Click en Enviar]     |

    Examples: Datos de salida
        | caso_creado_bd            | notificacion_equipo_soporte   | mensaje_pendiente_revision            |
        | [Ticket #1001 creado]     | [Alerta enviada a Soporte]    | "Su caso está pendiente de revisión"  |
        | [Ticket #1002 creado]     | [Alerta enviada a Soporte]    | "Su caso está pendiente de revisión"  |

Scenario Outline: Visualizar el resultado del reclamo
    Dado que el <usuario_autenticado> está en la <seccion_centro_soporte> y tiene un <historial_reclamos_usuario>
    Cuando realiza la <accion_seleccionar_mis_reclamos>
    Entonces el sistema muestra la <pantalla_mis_reclamos_visible> con la <lista_reclamos_respuestas>

    Examples: Datos de entrada
        | usuario_autenticado   | seccion_centro_soporte    | historial_reclamos_usuario    | accion_seleccionar_mis_reclamos   |
        | jsm0502@gmail.com     | "Centro de Soporte"       | [BD: Reclamos previos]        | [Click en "Mis reclamos"]         |
        | bodega.ecomart        | "Centro de Soporte"       | [BD: Reclamos previos]        | [Click en "Mis reclamos"]         |

    Examples: Datos de salida
        | pantalla_mis_reclamos_visible | lista_reclamos_respuestas                                     |
        | [Vista Mis Reclamos]          | [Ticket #1001: En proceso, Ticket #900: Solucionado]          |
        | [Vista Mis Reclamos]          | [Ticket #1002: En proceso]                                    |
