Feature: US29 - Visualización de la lista de puntos de reciclaje
    Como joven eco-consciente,
    Quiero ver una lista de puntos de recolección con detalles relevantes debajo del mapa,
    Para poder elegir el más adecuado según mis necesidades.

Scenario Outline: Visualización de lista de puntos debajo del mapa
    Dado que el <usuario_autenticado> se encuentre en la <seccion_search> con la <lista_de_puntos> disponible
    Cuando realiza la <accion_desplazar_abajo>
    Entonces el sistema deberá mostrar la <lista_tarjetas_puntos> compuesta de <tarjeta_punto> con información detallada

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_search    | lista_de_puntos           | accion_desplazar_abajo |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Search"  | [BD: 10 puntos cargados]  | [Scroll hacia abajo]   |
        | ana.perez@email.com (Eco-consciente)  | "Sección Search"  | [BD: 5 puntos filtrados]  | [Scroll hacia abajo]   |

    Examples: Datos de salida
        | lista_tarjetas_puntos                 | tarjeta_punto                                                         |
        | [Vista de lista scrollable]           | "Nombre, Dirección, Estrellas, Reseñas, Etiquetas (Plástico, Papel)"  |
        | [Vista de lista scrollable]           | "Nombre, Dirección, Estrellas, Reseñas, Etiquetas (Vidrio, Latas)"    |

Scenario Outline: Selección de un punto desde la lista inferior
    Dado que el <usuario_autenticado> esté visualizando la <lista_tarjetas_puntos> y el <mapa_visible>
    Cuando realiza la <accion_seleccionar_tarjeta>
    Entonces el sistema deberá mostrar el <marcador_resaltado> en el mapa y abrir el <recuadro_flotante> con la <info_detallada_punto>

    Examples: Datos de entrada
        | usuario_autenticado   | lista_tarjetas_puntos | mapa_visible          | accion_seleccionar_tarjeta        |
        | jsm0502@gmail.com     | [Lista visible]       | [Mapa superior]       | [Click en "Centro Acopio Norte"]  |
        | ana.perez@email.com   | [Lista visible]       | [Mapa superior]       | [Click en "Reciclador Juan"]      |

    Examples: Datos de salida
        | marcador_resaltado                    | recuadro_flotante     | info_detallada_punto                                  |
        | [Pin se agranda/cambia de color]      | [Pop-up sobre mapa]   | "Centro Acopio Norte - Av. Principal 123 - 4.8 ⭐"    |
        | [Pin se agranda/cambia de color]      | [Pop-up sobre mapa]   | "Reciclador Juan - Jr. Los Pinos 456 - 4.5 ⭐"        |
