Feature: US30 - Detalle de puntos seleccionados
    Como joven eco-consciente,
    Quiero acceder a los datos de cada punto (materiales, dirección y calificación),
    Para tomar decisiones informadas.

Scenario Outline: Visualización de información detallada de un punto
    Dado que el <usuario_autenticado> está en la <lista_tarjetas_puntos> y los <datos_completos_punto> están disponibles
    Cuando realiza la <accion_seleccionar_punto>
    Entonces el sistema deberá mostrar un <recuadro_informacion_detallada> con la <info_detallada>

    Examples: Datos de entrada
        | usuario_autenticado                   | lista_tarjetas_puntos | accion_seleccionar_punto          | datos_completos_punto                         |
        | jsm0502@gmail.com (Eco-consciente)    | "Lista de Resultados" | [Click en "Centro Acopio Norte"]  | {Dir: "Av. Paz", Mat: "Plástico", Cal: 4.5}   |
        | ana.perez@email.com (Eco-consciente)  | "Lista de Resultados" | [Click en "Reciclador Juan"]      | {Dir: "Calle 2", Mat: "Vidrio", Cal: 4.8}     |

    Examples: Datos de salida
        | recuadro_informacion_detallada    | info_detallada                                                    |
        | [Pop-up Detalle]                  | "Centro Acopio Norte\nDirección: Av. Paz\nMateriales: Plástico"   |
        | [Pop-up Detalle]                  | "Reciclador Juan\nDirección: Calle 2\nMateriales: Vidrio"         |

Scenario Outline: Comparación de diferentes puntos
    Dado que el <usuario_autenticado> desea comparar puntos usando el <mapa_o_lista>
    Cuando realiza la <accion_seleccionar_punto_A> y luego la <accion_seleccionar_punto_B>
    Entonces el sistema deberá mostrar el <recuadro_info_A> y el <recuadro_info_B> en un <formato_consistente>

    Examples: Datos de entrada
        | usuario_autenticado   | mapa_o_lista      | accion_seleccionar_punto_A    | accion_seleccionar_punto_B    |
        | jsm0502@gmail.com     | "Mapa Interactivo"| [Click en "Punto A"]          | [Click en "Punto B"]          |
        | ana.perez@email.com   | "Lista Resultados"| [Click en "Punto X"]          | [Click en "Punto Y"]          |

    Examples: Datos de salida
        | recuadro_info_A           | recuadro_info_B           | formato_consistente                               |
        | [Detalle Punto A visible] | [Detalle Punto B visible] | "Ambos recuadros muestran Dirección, Mat., Calif."|
        | [Detalle Punto X visible] | [Detalle Punto Y visible] | "Ambos recuadros muestran Dirección, Mat., Calif."|
