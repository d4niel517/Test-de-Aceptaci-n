Feature: US02 - Registro de observaciones en la publicación
    Como joven eco-consciente o bodega,
    Quiero poder agregar observaciones o comentarios adicionales al registrar mi material,
    Para dar indicaciones específicas al recolector.

Scenario Outline: Registro exitoso de observaciones
    Dado que el <usuario> se encuentra en el apartado <Registrar_material>
    Cuando complete los campos requeridos e ingrese una <observacion> en <Comentarios_adicionales>
    Entonces el sistema deberá mostrar la <confirmacion_registro>
    Y se verá reflejado en la <actualizacion_historial>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | observacion                                      | Comentarios_adicionales |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | "El material está en cajas de cartón selladas."  | [Campo de texto]        |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | "Por favor, tocar el timbre dos veces."          | [Campo de texto]        |

    Examples: Datos de salida
        | confirmacion_registro                 | actualizacion_historial                           |
        | "Observación registrada con éxito."   | [Registro visible en el historial del usuario]    |
        | "Observación registrada con éxito."   | [Registro visible en el historial del usuario]    |

Scenario Outline: Error por límite de caracteres superado
    Dado que el <usuario> se encuentra en <Registrar_material>
    Cuando intente ingresar una <observacion> que supere el <limite_de_caracteres_permitido>
    Entonces el sistema mostrará el mensaje de advertencia <error_limite_caracteres>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | observacion                                                                 | limite_de_caracteres_permitido |
        | jsm0502@gmail.com                     | "Registrar Material"  | [Texto muy largo de más de 2000 caracteres...]                              | 2000 caracteres                |

    Examples: Datos de salida
        | error_limite_caracteres                           |
        | "Error: la observación excede el límite permitido."|
