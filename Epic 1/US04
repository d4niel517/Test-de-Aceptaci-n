Feature: US04 - Clasificación automática de materiales (Validación de Registro)
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero que el sistema valide la información al registrar una publicación,
    Para agilizar el proceso y evitar errores.

Scenario Outline: Validación exitosa del registro
    Dado que el <usuario> se encuentra en <Registrar_material> y ha completado correctamente todos los campos
    Cuando presione el botón <Registrar>
    Entonces el sistema validará la información y mostrará un <Icono_verde>
    Y desplegará el mensaje <material_registrado>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | Registrar            |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | [Click en Registrar] |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | [Click en Registrar] |

    Examples: Datos de salida
        | Icono_verde       | material_registrado                            |
        | [Check Verde]     | "El material se ha registrado correctamente."  |
        | [Check Verde]     | "El material se ha registrado correctamente."  |

Scenario Outline: Error en completar los datos (Campos incompletos)
    Dado que el <usuario> se encuentra en <Registrar_material>
    Y deja un <campo_obligatorio> sin completar
    Entonces el sistema mostrará el <mensaje_error_datos_incompletos>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | campo_obligatorio |
        | jsm0502@gmail.com                     | "Registrar Material"  | [Cantidad vacío]  |
        | bodega.ecomart@email.com              | "Registrar Material"  | [Tipo vacío]      |

    Examples: Datos de salida
        | mensaje_error_datos_incompletos                                     |
        | "Error: faltan datos. Debe llenar todos los campos obligatorios."   |
        | "Error: faltan datos. Debe llenar todos los campos obligatorios."   |
