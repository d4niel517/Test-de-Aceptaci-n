Feature: US03 - Registro de observaciones (Sugerencia de Categoría)
    Como joven eco-consciente o bodega,
    Quiero recibir sugerencias automáticas al ingresar el tipo de material,
    Para facilitar el registro y asegurar que la categoría sea correcta antes de añadir notas.

Scenario Outline: Sugerencia automática de categoría
    Dado que el <usuario> se encuentra en <Registrar_material>
    Cuando comienza a escribir el <tipo_de_material> y el sistema lo compara con su base de datos
    Entonces el sistema mostrará una <sugerencia_de_categoria>
    Y una vez aceptada, el sistema <autocompletara_categoria>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | tipo_de_material |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | "Vid"            |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | "Plást"          |

    Examples: Datos de salida
        | sugerencia_de_categoria   | autocompletara_categoria      |
        | "Vidrio"                  | [Campo completado: "Vidrio"]  |
        | "Plástico"                | [Campo completado: "Plástico"]|

Scenario Outline: Error en la detección automática del material
    Dado que el <usuario> introduce un <tipo_de_material> no registrado en la base de datos
    Entonces el sistema mostrará el <mensaje_error_material_no_reconocido>

    Examples: Datos de entrada
        | usuario                               | tipo_de_material      |
        | jsm0502@gmail.com                     | "MaterialDesconocido" |
        | bodega.ecomart@email.com              | "Piedra pómez"        |

    Examples: Datos de salida
        | mensaje_error_material_no_reconocido                               |
        | "Material no reconocido. Seleccione una categoría manualmente."      |
        | "Material no reconocido. Seleccione una categoría manualmente."      |
