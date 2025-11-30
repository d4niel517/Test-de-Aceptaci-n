Feature: US31 - Generar ruta óptima entre puntos seleccionados
    Como joven eco-consciente,
    Quiero generar una ruta óptima entre varios puntos de recolección seleccionados,
    Para optimizar mi tiempo y reducir mi huella de carbono.

Scenario Outline: Selección de puntos para la ruta
    Dado que el <usuario_autenticado> está en el <mapa_o_lista_visible>
    Cuando realiza la <accion_agregar_a_ruta> (generando una <lista_puntos_seleccionados> de al menos dos)
    Entonces el sistema deberá mostrar una <linea_punteada_conexion> y el <boton_generar_ruta_habilitado>

    Examples: Datos de entrada
        | usuario_autenticado                   | mapa_o_lista_visible  | accion_agregar_a_ruta         | lista_puntos_seleccionados    |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Search"      | [Check en "Agregar a ruta"]   | [Punto A, Punto B]            |
        | ana.perez@email.com (Eco-consciente)  | "Sección Search"      | [Check en "Agregar a ruta"]   | [Punto X, Punto Y, Punto Z]   |

    Examples: Datos de salida
        | linea_punteada_conexion       | boton_generar_ruta_habilitado                 |
        | [Línea visual conectando A-B] | [Botón "Generar ruta" visible y clicable]     |
        | [Línea visual conectando X-Z] | [Botón "Generar ruta" visible y clicable]     |

Scenario Outline: Generación automática de ruta óptima
    Dado que el <usuario_autenticado> tiene una <lista_puntos_seleccionados> y el sistema conoce su <ubicacion_actual_usuario>
    Cuando realiza la <accion_presionar_generar_ruta>
    Entonces el sistema deberá mostrar la <linea_continua_ruta> con <marcadores_secuenciales>, un <mensaje_confirmacion> y las <opciones_guardar_ruta_habilitadas>

    Examples: Datos de entrada
        | usuario_autenticado   | lista_puntos_seleccionados    | ubicacion_actual_usuario  | accion_presionar_generar_ruta |
        | jsm0502@gmail.com     | [Punto A, Punto B]            | "San Borja, Lima"         | [Click en "Generar ruta"]     |
        | ana.perez@email.com   | [Punto X, Punto Y, Punto Z]   | "Miraflores, Lima"        | [Click en "Generar ruta"]     |

    Examples: Datos de salida
        | linea_continua_ruta       | marcadores_secuenciales   | mensaje_confirmacion                  | opciones_guardar_ruta_habilitadas |
        | [Trazo de ruta óptima]    | [1, 2]                    | "Ruta óptima generada exitosamente"   | [Botón "Guardar ruta" activo]     |
        | [Trazo de ruta óptima]    | [1, 2, 3]                 | "Ruta óptima generada exitosamente"   | [Botón "Guardar ruta" activo]     |
