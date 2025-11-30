Feature: US38 - Definir disponibilidad y visibilidad de mi perfil
    Como joven eco-consciente o bodega,
    Quiero que mi perfil muestre si estoy disponible o no,
    Para que otros usuarios sepan cuándo pueden contactarse conmigo.

Scenario Outline: Establecer visibilidad de la cuenta (En línea)
    Dado que el <usuario_autenticado> está en la <seccion_visibilidad>
    Cuando realiza la <accion_presionar_si>
    Entonces el sistema muestra el <icono_verde_visible>
    Y actualiza el <estado_en_linea_bd> y el <estado_publico_actualizado>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_visibilidad           | accion_presionar_si           |
        | jsm0502@gmail.com (Eco-consciente)    | "Mi Perfil > Visibilidad"     | [Click en "Sí" / Toggle ON]   |
        | bodega.ecomart@email.com (Bodega)     | "Mi Perfil > Visibilidad"     | [Click en "Sí" / Toggle ON]   |

    Examples: Datos de salida
        | icono_verde_visible                   | estado_en_linea_bd            | estado_publico_actualizado    |
        | [Ícono verde junto al avatar]         | "Estado: Online"              | "Visible para otros usuarios" |
        | [Ícono verde junto al avatar]         | "Estado: Online"              | "Visible para otros usuarios" |

Scenario Outline: Ocultar la visibilidad de la cuenta
    Dado que el <usuario_autenticado> está en la <seccion_visibilidad>
    Cuando realiza la <accion_presionar_no>
    Entonces el sistema oculta el <icono_verde_oculto>
    Y actualiza el <estado_oculto_bd> y el <estado_publico_actualizado>

    Examples: Datos de entrada
        | usuario_autenticado                   | seccion_visibilidad           | accion_presionar_no           |
        | jsm0502@gmail.com (Eco-consciente)    | "Mi Perfil > Visibilidad"     | [Click en "No" / Toggle OFF]  |
        | bodega.ecomart@email.com (Bodega)     | "Mi Perfil > Visibilidad"     | [Click en "No" / Toggle OFF]  |

    Examples: Datos de salida
        | icono_verde_oculto                    | estado_oculto_bd              | estado_publico_actualizado    |
        | [Ícono de estado desaparece]          | "Estado: Offline/Hidden"      | "No visible (Estado oculto)"  |
        | [Ícono de estado desaparece]          | "Estado: Offline/Hidden"      | "No visible (Estado oculto)"  |
