Feature: US39 - Vincular método de pago / datos para cobros
    Como joven eco-consciente o bodega,
    Quiero vincular mi cuenta bancaria o método de pago,
    Para recibir y gestionar cobros por servicios.

Scenario Outline: Seleccionar método de pago
    Dado que el <usuario_autenticado> está en la <pestaña_pagos_y_cobros>
    Cuando realiza la <accion_vincular_metodo>, ingresa los <datos_bancarios> y realiza la <accion_guardar_datos>
    Entonces el <metodo_pago_guardado_bd> se almacena, y se muestra el <estado_verificado_visible> y <metodo_listo_para_usar>

    Examples: Datos de entrada
        | usuario_autenticado                   | pestaña_pagos_y_cobros    | accion_vincular_metodo        | datos_bancarios               | accion_guardar_datos  |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Pagos"           | [Click "Agregar Cuenta"]      | "BCP, Soles, 191-123456..."   | [Click en Guardar]    |
        | bodega.ecomart@email.com (Bodega)     | "Sección Pagos"           | [Click "Agregar Yape/Plin"]   | "Número vinculado: 999888777" | [Click en Guardar]    |

    Examples: Datos de salida
        | metodo_pago_guardado_bd               | estado_verificado_visible | metodo_listo_para_usar        |
        | [Datos encriptados guardados en BD]   | [Etiqueta: Verificado]    | [Estado: Disponible para uso] |
        | [Datos encriptados guardados en BD]   | [Etiqueta: Verificado]    | [Estado: Disponible para uso] |

Scenario Outline: Modificar método de pago y cobro
    Dado que el <usuario_autenticado> está en la <pestaña_pagos_y_cobros>
    Cuando realiza la <accion_editar_metodo> y envía los <datos_actualizados_o_eliminados> con <accion_confirmar_cambios>
    Entonces el <metodo_pago_actualizado_bd> se actualiza, se muestra el <mensaje_metodo_actualizado> y se genera un <registro_historial_perfil>

    Examples: Datos de entrada
        | usuario_autenticado   | pestaña_pagos_y_cobros    | accion_editar_metodo          | datos_actualizados_o_eliminados   | accion_confirmar_cambios  |
        | jsm0502@gmail.com     | "Sección Pagos"           | [Click en "Editar Cuenta"]    | "Nuevo CCI: 002-191..."           | [Click Confirmar]         |
        | bodega.ecomart        | "Sección Pagos"           | [Click en "Eliminar Método"]  | [Acción de eliminar]              | [Click Confirmar]         |

    Examples: Datos de salida
        | metodo_pago_actualizado_bd    | mensaje_metodo_actualizado    | registro_historial_perfil             |
        | [BD Actualizada con nuevo CCI]| "Método actualizado"          | [Log: Cambio de información bancaria] |
        | [Registro eliminado de BD]    | "Método actualizado"          | [Log: Eliminación de método de pago]  |
