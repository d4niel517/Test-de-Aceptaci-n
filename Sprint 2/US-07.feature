Feature: US07 - Validación de entrega mediante Código QR
    Como joven eco-consciente o bodega,
    Quiero validar la entrega de materiales mediante el escaneo de un código QR,
    Para asegurar que la transacción se registre de manera segura y confiable.

Scenario Outline: Validación de código QR y visualización de datos de entrega
    Dado que el <joven_eco_consciente> ha llegado al punto de recolección
    Cuando seleccione la opción <Escanear_QR> y apunte la cámara hacia el <codigo_bodega>
    Entonces el sistema validará el código y mostrará los <datos_de_recojo>

    Examples: Datos de entrada
        | joven_eco_consciente                  | Escanear_QR           | codigo_bodega       |
        | jsm0502@gmail.com (Eco-consciente)    | [Botón Escanear]      | [QR Bodega EcoMart] |
        | ana.perez@email.com (Eco-consciente)  | [Botón Escanear]      | [QR Reciclador Municipal] |

    Examples: Datos de salida
        | datos_de_recojo                                           |
        | "Bodega EcoMart, Usuario: Juan, Material: Plástico"       |
        | "Reciclador Municipal, Usuario: Ana, Material: Vidrio"    |

Scenario Outline: Confirmación exitosa de entrega mediante QR
    Dado que el <joven_eco_consciente> haya escaneado correctamente el <codigo_QR> generado por la <bodega>
    Cuando presione <Confirmar_entrega>
    Entonces el sistema actualizará el estado a "Recolectada" y mostrará el mensaje <entrega_confirmada_con_exito>

    Examples: Datos de entrada
        | joven_eco_consciente  | codigo_QR             | bodega            | Confirmar_entrega    |
        | jsm0502@gmail.com     | [ID de Transacción]   | "Bodega EcoMart"  | [Click en Confirmar] |

    Examples: Datos de salida
        | entrega_confirmada_con_exito      | notificacion_usuario                  |
        | "Entrega confirmada con éxito."   | "Se ha validado correctamente la entrega." |
