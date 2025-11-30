Feature: US17 - Recompensas diarias y desafíos de reciclaje
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero recibir recompensas diarias y completar desafíos dentro de la aplicación,
    Para mantenerme motivado a reciclar de forma constante y divertida.

Scenario Outline: Reclamo de recompensa diaria por racha
    Dado que el <usuario> tenga al menos un día consecutivo usando la aplicación
    Cuando acceda a la sección <Incentivos> y seleccione la opción <Reclamar_puntos_de_recompensa>
    Entonces el sistema mostrará el <numero_de_dias_consecutivos_en_racha>
    Y otorgará automáticamente los <puntos_correspondientes> y actualizará el <contador_de_racha>

    Examples: Datos de entrada
        | usuario                               | Incentivos            | Reclamar_puntos_de_recompensa |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Incentivos"  | [Botón Reclamar Diario]       |
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | [Botón Reclamar Diario]       |

    Examples: Datos de salida
        | numero_de_dias_consecutivos_en_racha  | puntos_correspondientes   | contador_de_racha         |
        | "¡3 días en racha!"                   | "10 Puntos sumados"       | [Contador actualizado a 4]|
        | "¡7 días en racha!"                   | "50 Puntos sumados"       | [Contador actualizado a 8]|

Scenario Outline: Reclamo de puntos por desafíos completados
    Dado que el <usuario> complete un <desafio> (ej. verificar perfil, realizar entrega)
    Cuando el desafío sea marcado como <cumplido> y se habilite el <boton_de_reclamo>
    Entonces el sistema otorgará los <puntos_correspondientes> y reflejará el <progreso_en_historial>

    Examples: Datos de entrada
        | usuario                   | desafio                   | cumplido      | boton_de_reclamo          |
        | jsm0502@gmail.com         | "Verificar Perfil"        | "Completado"  | [Botón verde activo]      |
        | bodega.ecomart@email.com  | "Realizar 10 entregas"    | "Completado"  | [Botón verde activo]      |

    Examples: Datos de salida
        | puntos_correspondientes   | progreso_en_historial                     |
        | "100 Puntos ganados"      | [Registro: Logro 'Perfil Verificado']     |
        | "500 Puntos ganados"      | [Registro: Logro '10 Entregas']           |
