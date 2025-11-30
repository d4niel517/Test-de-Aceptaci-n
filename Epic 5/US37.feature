Feature: US37 - Subir documentación para verificación
    Como bodega o joven eco-consciente,
    Quiero subir documentación (DNI, credenciales) para ser verificado,
    Para generar confianza en la comunidad.

Scenario Outline: El usuario verifica su cuenta (Envío de documentos)
    Dado que el <usuario_autenticado> (no verificado) está en la <seccion_verificacion>
    Cuando adjunta los <archivos_documentos> y realiza la <accion_presionar_enviar>
    Entonces el sistema guarda los <archivos_guardados_sistema>, actualiza el <estado_pendiente_revision> y muestra un <mensaje_pendiente>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_verificacion  | archivos_documentos       | accion_presionar_enviar       |
        | bodega.ecomart@email.com (Bodega)     | "Panel Verificación"  | [Foto DNI, Licencia]      | [Click en "Enviar"]           |
        | jsm0502@gmail.com (Eco-consciente)    | "Panel Verificación"  | [Foto DNI]                | [Click en "Enviar"]           |

    Examples: Datos de salida
        | archivos_guardados_sistema    | estado_pendiente_revision | mensaje_pendiente                                     |
        | [Archivos en Backend]         | "Pendiente de revisión"   | "Solicitud en proceso. Espere validación."            |
        | [Archivos en Backend]         | "Pendiente de revisión"   | "Solicitud en proceso. Espere validación."            |

Scenario Outline: Estado final de la verificación del usuario
    Dado que el <usuario_pendiente_verificacion> está esperando una respuesta
    Cuando el equipo de soporte realiza la <accion_equipo_revision> resultando en <resultado_revision>
    Entonces el sistema actualiza el estado a <nuevo_estado_bd>
    Y envía la <notificacion_correspondiente> y muestra el <elemento_visual_perfil>

    Examples: Datos de entrada
        | usuario_pendiente_verificacion | accion_equipo_revision | resultado_revision |
        | bodega.ecomart (Pendiente)     | [Revisión Manual]      | "Aprobado"         |
        | jsm0502 (Pendiente)            | [Revisión Manual]      | "Rechazado"        |

    Examples: Datos de salida
        | nuevo_estado_bd | notificacion_correspondiente           | elemento_visual_perfil                |
        | "Verificado"    | "¡Tu cuenta ha sido verificada!"       | [Insignia "Verificado"]               |
        | "Rechazado"     | "Tu documentación ha sido rechazada."  | [Mensaje "Documentación rechazada"]   |
