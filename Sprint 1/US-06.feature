Feature: US06 - Definir disponibilidad de recojo (Selección de Fecha)
    Como joven eco-consciente o bodega,
    Quiero seleccionar una fecha válida en el calendario,
    Para agendar el momento en que se realizará el recojo de mis materiales.

Scenario Outline: Selección exitosa de fecha disponible
    Dado que el <usuario> se encuentra en <Registrar_material>
    Cuando abra el campo <Disponibilidad> y seleccione una <fecha_valida> dentro del calendario
    Entonces el sistema deberá cambiar la fecha actual por la ingresada
    Y mostrará el <mensaje_confirmacion_fecha>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | Disponibilidad      | fecha_valida |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | [Selector de Fecha] | "20/11/2025" |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | [Selector de Fecha] | "25/12/2025" |

    Examples: Datos de salida
        | mensaje_confirmacion_fecha                      |
        | "Fecha de disponibilidad registrada con éxito." |
        | "Fecha de disponibilidad registrada con éxito." |

Scenario Outline: Error por fecha pasada
    Dado que el <usuario> se encuentra en <Registrar_material>
    Cuando intente seleccionar una <fecha_pasada>
    Entonces el sistema deberá mostrar el <mensaje_error_fecha_no_disponible>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | fecha_pasada |
        | jsm0502@gmail.com                     | "Registrar Material"  | "01/01/2020" |
        | bodega.ecomart@email.com              | "Registrar Material"  | "15/05/1990" |

    Examples: Datos de salida
        | mensaje_error_fecha_no_disponible                               |
        | "El horario seleccionado no está disponible, por favor elija otro." |
        | "El horario seleccionado no está disponible, por favor elija otro." |
