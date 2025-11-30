Feature: US26 - Visualizar puntos en el mapa
    Como joven eco-consciente,
    Quiero ver los puntos de recolección en un mapa,
    Para identificar fácilmente las opciones cercanas.

Scenario Outline: Visualización inicial del mapa con íconos diferenciados
    Dado que el <usuario_autenticado> haya iniciado sesión en la aplicación y se encuentre en la <seccion_search>
    Cuando realiza la <accion_abrir_mapa>
    Entonces el sistema deberá mostrar el <mapa_visible> con <iconos_diferenciados> basados en la <lista_de_puntos>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_search    | accion_abrir_mapa | lista_de_puntos       |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Search"  | [Click en Mapa]   | [Datos: 5 puntos cercanos] |
        | ana.perez@email.com (Eco-consciente)  | "Sección Search"  | [Click en Mapa]   | [Datos: 3 puntos cercanos] |

    Examples: Datos de salida
        | mapa_visible          | iconos_diferenciados                                          |
        | [Interfaz de Mapa]    | [Íconos: Comercio, Reciclador, Municipal]                     |
        | [Interfaz de Mapa]    | [Íconos: Comercio, Reciclador, Municipal]                     |

Scenario Outline: Selección de un punto en el mapa
    Dado que el <usuario_autenticado> se encuentre en el <mapa_interactivo> y tiene los <datos_del_punto> disponibles
    Cuando realiza la <accion_seleccionar_icono> sobre un marcador
    Entonces el sistema deberá desplegar un <recuadro_flotante> con la <info_detallada_punto>

    Examples: Datos de entrada
        | usuario_autenticado   | mapa_interactivo      | datos_del_punto               | accion_seleccionar_icono      |
        | jsm0502@gmail.com     | [Mapa cargado]        | {Nombre: "Acopio Norte", Calif: 4.5} | [Click en marcador "Acopio Norte"] |
        | ana.perez@email.com   | [Mapa cargado]        | {Nombre: "Bodega Luis", Calif: 5.0}  | [Click en marcador "Bodega Luis"]  |

    Examples: Datos de salida
        | recuadro_flotante     | info_detallada_punto                                              |
        | [Pop-up visible]      | "Dirección: Av. Paz, Materiales: Plástico, Calificación: 4.5"     |
        | [Pop-up visible]      | "Dirección: Calle 2, Materiales: Vidrio, Calificación: 5.0"       |
