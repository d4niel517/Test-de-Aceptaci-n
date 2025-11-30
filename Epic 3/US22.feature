Feature: US22 - Notificaciones de logros y nuevas recompensas
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero recibir notificaciones cuando complete un logro o esté disponible una nueva recompensa,
    Para mantenerme informado y motivado a seguir participando activamente.

Scenario Outline: Notificación de logro alcanzado
    Dado que el <usuario> complete un <desafio> o alcance una <nueva_racha>
    Cuando esto ocurra en el sistema
    Entonces el sistema mostrará una <notificacion_emergente> con el mensaje <Felicitaciones_logro> y los <puntos_ganados>

    Examples: Datos de entrada
        | usuario                               | desafio               | nueva_racha   |
        | jsm0502@gmail.com (Eco-consciente)    | "Reciclar 5kg"        | "3 días"      |
        | bodega.ecomart@email.com (Bodega)     | "Validar 10 entregas" | "7 días"      |

    Examples: Datos de salida
        | notificacion_emergente | Felicitaciones_logro                               | puntos_ganados |
        | [Pop-up Superior]      | "¡Felicidades! Has alcanzado un nuevo logro."      | "+50 pts"      |
        | [Pop-up Superior]      | "¡Felicidades! Has alcanzado una racha de 7 días." | "+100 pts"     |

Scenario Outline: Notificación de nueva recompensa disponible
    Dado que se añadan <nuevos_beneficios> en la <Tienda_de_puntos>
    Cuando el <usuario> tenga <puntos_suficientes> para canjear alguno
    Entonces el sistema enviará una <notificacion_emergente> informando que puede acceder al nuevo beneficio

    Examples: Datos de entrada
        | usuario                   | Tienda_de_puntos      | nuevos_beneficios         | puntos_suficientes |
        | jsm0502@gmail.com         | "Catálogo de Canje"   | "Vale de descuento 20%"   | "Saldo: 500 pts"   |
        | bodega.ecomart@email.com  | "Catálogo de Canje"   | "Publicidad Premium"      | "Saldo: 1000 pts"  |

    Examples: Datos de salida
        | notificacion_emergente                                    |
        | "Tienes un nuevo beneficio disponible para canjear."      |
        | "Tienes un nuevo beneficio disponible para canjear."      |
