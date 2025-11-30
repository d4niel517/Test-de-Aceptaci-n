Feature: US36 - Completar datos básicos del perfil
    Como joven eco-consciente o bodega,
    Quiero completar mi perfil (nombre, teléfono, correo),
    Para que los ciudadanos puedan conocerme y contactarme.

Scenario Outline: El usuario completa por primera vez su perfil
    Dado que el <usuario_registrado> está en la <seccion_mi_perfil>
    Cuando ingresa los <datos_basicos_ingresados>, selecciona la <opcion_visibilidad_publica> y realiza la <accion_presionar_guardar>
    Entonces los <datos_almacenados_bd> se guardan y se actualiza el <perfil_publico_actualizado>

    Examples: Datos de entrada
        | usuario_registrado                    | seccion_mi_perfil     | datos_basicos_ingresados                  | opcion_visibilidad_publica | accion_presionar_guardar |
        | "Joven Nuevo (Recién registrado)"     | "Editar Perfil"       | "Luis, 999888777, luis@mail.com"          | [Check: Visible]           | [Click en Guardar]       |
        | "Bodega Nueva (Recién registrada)"    | "Editar Perfil"       | "EcoMart, 987654321, contacto@eco.pe"     | [Check: Visible]           | [Click en Guardar]       |

    Examples: Datos de salida
        | datos_almacenados_bd                  | perfil_publico_actualizado                    |
        | [Datos guardados en tabla Users]      | [Perfil visible para otros usuarios]          |
        | [Datos guardados en tabla Users]      | [Perfil visible para otros usuarios]          |

Scenario Outline: El usuario edita y actualiza los datos de su perfil
    Dado que el <usuario_autenticado> está en la <seccion_mi_perfil>
    Cuando ingresa los <datos_modificados> y realiza la <accion_presionar_confirmar_cambios>
    Entonces el sistema muestra una <ventana_modal_confirmacion> con el <mensaje_confirmacion_cambios> y el <boton_confirmar_final>

    Examples: Datos de entrada
        | usuario_autenticado   | seccion_mi_perfil | datos_modificados             | accion_presionar_confirmar_cambios |
        | jsm0502@gmail.com     | "Editar Perfil"   | "Teléfono: 999000111"         | [Click en Confirmar Cambios]       |
        | bodega.ecomart        | "Editar Perfil"   | "Nombre: Bodega EcoMart 2.0"  | [Click en Confirmar Cambios]       |

    Examples: Datos de salida
        | ventana_modal_confirmacion    | mensaje_confirmacion_cambios      | boton_confirmar_final |
        | [Pop-up visible]              | "¿Desea confirmar los cambios?"   | [Botón "Confirmar"]   |
        | [Pop-up visible]              | "¿Desea confirmar los cambios?"   | [Botón "Confirmar"]   |
