Feature: US10 - Visualización del Perfil y Reputación (Joven Eco-consciente)
    Como bodega o usuario,
    Quiero ver el perfil y las calificaciones del joven eco-consciente,
    Para conocer su reputación antes de coordinar la recolección.

Scenario Outline: Visualización del perfil del joven eco-consciente
    Dado que el <usuario> se encuentra en la sección <Entregas_y_Recojos>
    Cuando presione la <foto_de_perfil> o el <nombre_del_joven_eco_consciente>
    Entonces el sistema deberá mostrar una <pantalla_de_perfil> con la información básica

    Examples: Datos de entrada
        | usuario                               | Entregas_y_Recojos    | foto_de_perfil        | nombre_del_joven_eco_consciente |
        | bodega.ecomart@email.com (Bodega)     | "Entregas y Recojos"  | [Click en Foto]       | "Juan Silva"                    |
        | tienda.pepe@email.com (Bodega)        | "Entregas y Recojos"  | [Click en Foto]       | "Ana Pérez"                     |

    Examples: Datos de salida
        | pantalla_de_perfil                                |
        | [Interfaz con foto, nombre y datos de contacto]   |
        | [Interfaz con foto, nombre y datos de contacto]   |

Scenario Outline: Visualización de calificaciones y reputación
    Dado que el <usuario> se encuentra en la <pantalla_de_perfil>
    Cuando consulte la sección de reputación
    Entonces el sistema mostrará la <puntuacion_promedio>, el <numero_total_de_valoraciones> y los <comentarios_destacados>

    Examples: Datos de entrada
        | usuario                   | pantalla_de_perfil    |
        | bodega.ecomart@email.com  | [Perfil de Juan Silva]|
        | tienda.pepe@email.com     | [Perfil de Ana Pérez] |

    Examples: Datos de salida
        | puntuacion_promedio   | numero_total_de_valoraciones  | comentarios_destacados                        |
        | "4.8 Estrellas"       | "150 Valoraciones"            | "Muy puntual", "Amable y rápido"              |
        | "5.0 Estrellas"       | "45 Valoraciones"             | "Excelente servicio", "Muy responsable"       |
