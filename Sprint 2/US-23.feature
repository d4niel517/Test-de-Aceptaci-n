Feature: US23 - Niveles de participación eco-responsable
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero alcanzar distintos niveles de participación (Bronce, Plata, Oro, Platino) según mis puntos acumulados,
    Para sentir reconocimiento y progreso dentro de la comunidad QhuriNet.

Scenario Outline: Visualización del nivel actual
    Dado que el <usuario> acceda a la sección <Incentivos>
    Cuando se muestre el panel principal dentro del apartado <Recompensa_diaria>
    Entonces el sistema mostrará un <cuadro_informativo> con el <nivel_actual>, <icono_distintivo> y un <mensaje_motivacional>
    Y mostrará una <barra_de_progreso> hacia el siguiente nivel

    Examples: Datos de entrada
        | usuario                               | Incentivos            | Recompensa_diaria     |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Incentivos"  | "Panel Principal"     |
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | "Panel Principal"     |

    Examples: Datos de salida
        | nivel_actual  | icono_distintivo  | mensaje_motivacional                      | barra_de_progreso |
        | "Nivel Plata" | [Medalla Plata]   | "¡Sigue reciclando para alcanzar el Oro!" | "75% completado"  |
        | "Nivel Oro"   | [Medalla Oro]     | "¡Estás muy cerca del Platino!"           | "90% completado"  |

Scenario Outline: Ascenso de nivel
    Dado que el <usuario> supere el <umbral_de_puntos> requerido para un nuevo nivel
    Cuando esto ocurra en el sistema
    Entonces el sistema actualizará su <nivel_actualizado>
    Y mostrará una <notificacion_emergente> otorgando una <recompensa_adicional>

    Examples: Datos de entrada
        | usuario                   | umbral_de_puntos  |
        | jsm0502@gmail.com         | "1000 puntos"     |
        | bodega.ecomart@email.com  | "5000 puntos"     |

    Examples: Datos de salida
        | nivel_actualizado | notificacion_emergente                            | recompensa_adicional |
        | "Nivel Oro"       | "¡Felicidades! Has subido de rango a Nivel Oro."  | "+10 puntos bonus"   |
        | "Nivel Platino"   | "¡Felicidades! Has subido de rango a Nivel Platino."| "+20 puntos bonus"   |
