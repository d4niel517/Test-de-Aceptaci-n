Feature: US12 - Gestión de Incidencias en Recolección
    Como usuario (bodega o joven eco-consciente),
    Quiero reportar problemas ocurridos durante la recolección,
    Para dejar constancia de cualquier irregularidad en el servicio.

Scenario Outline: Registro exitoso de incidencia
    Dado que el <usuario> se encuentra en la sección <Mi_perfil> dentro del <Historial_de_Actividades>
    Cuando detecta un <problema_durante_la_recoleccion>, presiona el ícono de <Reporte> e ingresa una <descripcion> y <foto_adjunta>
    Entonces el sistema deberá almacenar la información y mostrar el <mensaje_incidencia_exitosa>

    Examples: Datos de entrada
        | usuario                               | Mi_perfil   | Historial_de_Actividades  | problema_durante_la_recoleccion | Reporte             | descripcion                     | foto_adjunta        |
        | bodega.ecomart@email.com (Bodega)     | "Mi Perfil" | "Historial de Actividades"| Recolección incompleta          | [Icono de Reporte]  | "El recolector no llevó todo"   | [foto_evidencia.jpg]|
        | jsm0502@gmail.com (Eco-consciente)    | "Mi Perfil" | "Historial de Actividades"| Material rechazado              | [Icono de Reporte]  | "La bodega rechazó el vidrio"   | [foto_rechazo.jpg]  |

    Examples: Datos de salida
        | mensaje_incidencia_exitosa        |
        | "Incidencia reportada con éxito." |
        | "Incidencia reportada con éxito." |

Scenario Outline: Error al registrar incidencia (Campos incompletos)
    Dado que el <usuario> esté en <Mi_perfil> y en el apartado <Historial_de_Actividades>
    Cuando intente hacer un reporte sin completar todos los <campos_requeridos> (como la descripción o la foto)
    Entonces el sistema mostrará el <mensaje_error_incidencia_incompleta>

    Examples: Datos de entrada
        | usuario                   | Mi_perfil   | Historial_de_Actividades   | campos_requeridos           |
        | bodega.ecomart@email.com  | "Mi Perfil" | "Historial de Actividades" | [Descripción vacía]         |
        | jsm0502@gmail.com         | "Mi Perfil" | "Historial de Actividades" | [Foto no adjuntada]         |

    Examples: Datos de salida
        | mensaje_error_incidencia_incompleta                         |
        | "Error al registrar la incidencia, completa todos los campos."|
        | "Error al registrar la incidencia, completa todos los campos."|
