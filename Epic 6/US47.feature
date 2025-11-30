Feature: US47 - Visualizar historial de actividades
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero consultar mi historial de actividades para revisar mis entregas y recojos realizados, junto con sus detalles.

Scenario Outline: Visualización del historial
    Dado que el <usuario> se encuentra en el apartado <Mi_perfil>
    Cuando acceda a la sección <Historial_de_Actividades>
    Entonces el sistema deberá mostrar la lista de actividades con <tipo_actividad>, <material_reciclado>, <persona_encargada>, <tiempo_transcurrido>, <icono_advertencia> y los botones <boton_PDF> y <boton_CSV>

    Examples: Datos de entrada
        | usuario                               | Mi_perfil             | Historial_de_Actividades |
        | jsm0502@gmail.com (Eco-consciente)    | "Sección Mi Perfil"   | "Historial Actividades"  |
        | bodega.ecomart@email.com (Bodega)     | "Sección Mi Perfil"   | "Historial Actividades"  |

    Examples: Datos de salida
        | tipo_actividad | material_reciclado     | persona_encargada     | tiempo_transcurrido   | icono_advertencia     | boton_PDF     | boton_CSV     |
        | "Entrega"      | "Bolsas de plástico"   | "Juan Silva"          | "Hace 8 horas"        | [Sin alerta]          | [Visible]     | [Visible]     |
        | "Recojo"       | "Cartón y papel"       | "Por definir"         | "Hace 20 horas"       | [Alerta Visible]      | [Visible]     | [Visible]     |

Scenario Outline: Historial vacío para usuario nuevo
    Dado que el <usuario> es nuevo en la plataforma y no tiene actividades registradas
    Cuando acceda a <Historial_de_Actividades>
    Entonces el sistema deberá mostrar el mensaje <mensaje_historial_vacio>

    Examples: Datos de entrada
        | usuario                               | Historial_de_Actividades |
        | usuario.nuevo@email.com               | "Historial Actividades"  |

    Examples: Datos de salida
        | mensaje_historial_
