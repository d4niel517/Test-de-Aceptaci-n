Feature: US33 - Guardar y reutilizar rutas personalizadas
    Como joven eco-consciente,
    Quiero guardar mis rutas de reciclaje más frecuentes,
    Para reutilizarlas fácilmente en futuras jornadas.

Scenario Outline: Guardar ruta personalizada
    Dado que el <usuario_autenticado> tiene una <ruta_optima_generada>
    Cuando realiza la <accion_presionar_guardar_ruta>
    Y en la <ventana_modal_guardar> ingresa el <nombre_ruta>, <descripcion_ruta> (opcional) y realiza la <accion_confirmar_guardado>
    Entonces se crea la <ruta_almacenada_bd> y se muestra un <mensaje_confirmacion>

    Examples: Datos de entrada
        | usuario_autenticado                   | ruta_optima_generada  | accion_presionar_guardar_ruta | ventana_modal_guardar | nombre_ruta           | descripcion_ruta      | accion_confirmar_guardado |
        | jsm0502@gmail.com (Eco-consciente)    | [Ruta A-B-C activa]   | [Click "Guardar ruta"]        | [Formulario visible]  | "Ruta de los viernes" | "Recojo semanal"      | [Click "Confirmar"]       |
        | ana.perez@email.com (Eco-consciente)  | [Ruta X-Y activa]     | [Click "Guardar ruta"]        | [Formulario visible]  | "Ruta oficina"        | [Vacío]               | [Click "Confirmar"]       |

    Examples: Datos de salida
        | ruta_almacenada_bd                    | mensaje_confirmacion                          |
        | {id: 1, puntos: [A,B,C], orden: 1-3}  | "Ruta guardada correctamente en tu perfil"    |
        | {id: 2, puntos: [X,Y], orden: 1-2}    | "Ruta guardada correctamente en tu perfil"    |

Scenario Outline: Cargar una ruta guardada previamente
    Dado que el <usuario_autenticado> está en el <apartado_rutas_guardadas> viendo su <lista_rutas_guardadas>
    Cuando realiza la <accion_seleccionar_ruta>
    Entonces el sistema deberá mostrar la <ruta_guardada_visible_mapa> con sus <marcadores_orden_original>
    Y habilitar el <icono_eliminar_habilitado> y el <icono_editar_habilitado>

    Examples: Datos de entrada
        | usuario_autenticado   | apartado_rutas_guardadas  | lista_rutas_guardadas     | accion_seleccionar_ruta       |
        | jsm0502@gmail.com     | "Sección Mis Rutas"       | ["Ruta viernes", "Casa"]  | [Click en "Ruta viernes"]     |
        | ana.perez@email.com   | "Sección Mis Rutas"       | ["Ruta oficina"]          | [Click en "Ruta oficina"]     |

    Examples: Datos de salida
        | ruta_guardada_visible_mapa    | marcadores_orden_original | icono_eliminar_habilitado | icono_editar_habilitado   |
        | [Trazo completo en mapa]      | [Pines numerados 1, 2, 3] | [Visible/Clicable]        | [Visible/Clicable]        |
        | [Trazo completo en mapa]      | [Pines numerados 1, 2]    | [Visible/Clicable]        | [Visible/Clicable]        |
