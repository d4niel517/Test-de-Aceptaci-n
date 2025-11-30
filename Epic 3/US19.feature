Feature: US19 - Recordatorios y estados de incentivos
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero recibir recordatorios y visualizar claramente el estado de mis incentivos,
    Para no perder oportunidades de ganar puntos y recompensas.

Scenario Outline: Disponibilidad de la recompensa diaria
    Dado que el <usuario> acceda a <Incentivos> y visualice el apartado <Recompensa_diaria>
    Entonces el sistema mostrará el beneficio con el estado <estado_recompensa>
    Y mostrará el <contador_de_racha_correspondiente>

    Examples: Datos de entrada
        | usuario                               | Incentivos            | Recompensa_diaria         |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Incentivos"  | "Módulo Recompensa Diaria"|
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | "Módulo Recompensa Diaria"|

    Examples: Datos de salida
        | estado_recompensa             | contador_de_racha_correspondiente |
        | "Disponible_para_reclamar"    | "Racha actual: 3 días"            |
        | "Ya_reclamado"                | "Racha actual: 5 días"            |

Scenario Outline: Estado de los desafíos
    Dado que el <usuario> consulte la sección <Desafios> y revise los retos
    Entonces el sistema mostrará cada <desafio> con su <estado_actual>
    Y el <boton_Reclamar> aparecerá habilitado en verde si corresponde

    Examples: Datos de entrada
        | usuario                   | Desafios              |
        | jsm0502@gmail.com         | "Sección Desafíos"    |
        | bodega.ecomart@email.com  | "Sección Desafíos"    |

    Examples: Datos de salida
        | desafio               | estado_actual   | boton_Reclamar            |
        | "Verificar perfil"    | "Pendiente"     | [Inactivo / Oculto]       |
        | "Realizar 5 entregas" | "Completado"    | [Habilitado en verde]     |
