Feature: US28 - Buscador de puntos de recolección
    Como joven eco-consciente,
    Quiero buscar puntos por nombre o dirección,
    Para ahorrar tiempo en la localización.

Scenario Outline: Búsqueda por nombre o dirección
    Dado que el <usuario_autenticado> se encuentre en la sección "Search" y tiene disponible la <lista_de_puntos_completa>
    Cuando realiza la <accion_escribir> e ingresa un <termino_busqueda> en el <campo_buscador>
    Entonces el sistema deberá mostrar el <mapa_actualizado> y la <lista_resultados>

    Examples: Datos de entrada
        | usuario_autenticado                   | lista_de_puntos_completa  | accion_escribir   | termino_busqueda      | campo_buscador    |
        | jsm0502@gmail.com (Eco-consciente)    | [BD: Todos los puntos]    | [Escribir texto]  | "Centro Acopio Norte" | [Barra búsqueda]  |
        | ana.perez@email.com (Eco-consciente)  | [BD: Todos los puntos]    | [Escribir texto]  | "Av. Arequipa"        | [Barra búsqueda]  |

    Examples: Datos de salida
        | mapa_actualizado                          | lista_resultados                          |
        | [Mapa mostrando solo "Centro Acopio"]     | [Item: Centro Acopio Norte]               |
        | [Mapa mostrando puntos en Av. Arequipa]   | [Lista de puntos en esa avenida]          |

Scenario Outline: Búsqueda sin resultados
    Dado que el <usuario_autenticado> ingresa un <termino_busqueda_invalido> en el <campo_buscador>
    Cuando realiza la <accion_presionar_buscar>
    Entonces el sistema deberá mostrar un <mensaje_no_resultados>, un <mapa_vacio> y una <lista_vacia>

    Examples: Datos de entrada
        | usuario_autenticado   | termino_busqueda_invalido | campo_buscador    | accion_presionar_buscar |
        | jsm0502@gmail.com     | "Planeta Marte"           | [Barra búsqueda]  | [Click en Buscar]       |
        | ana.perez@email.com   | "Callejón Inexistente"    | [Barra búsqueda]  | [Click en Buscar]       |

    Examples: Datos de salida
        | mensaje_no_resultados                                             | mapa_vacio            | lista_vacia       |
        | "No se encontraron puntos de recolección con ese criterio."       | [Sin marcadores]      | [Lista vacía]     |
        | "No se encontraron puntos de recolección con ese criterio."       | [Sin marcadores]      | [Lista vacía]     |
