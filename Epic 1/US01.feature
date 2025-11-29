Feature: US01 - Registro de material reciclable
    Como joven eco-consciente o bodega/pequeños comercios,
    Quiero registrar el tipo y cantidad de material reciclable,
    Para evitar acumulación en mi casa.

Scenario Outline: Registro exitoso del material reciclable
    Dado que el <usuario> se encuentra en el apartado <Registrar_material>
    Cuando completa los campos <tipos_de_material>, <cantidad>, <horario_de_recojo>, sube una <foto> y define el <pago_opcional>
    Y presiona el botón <Registrar>
    Entonces el sistema almacena la <informacion>
    Y muestra el <mensaje_de_confirmacion> y realiza la <actualizacion_de_historial>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | tipos_de_material | cantidad | horario_de_recojo | foto           | pago_opcional | Registrar            |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | Plástico          | 5 kg     | 10:00 AM - 12:00 PM| [foto_botellas.jpg]| Sí (S/ 2.00)  | [Click en Registrar] |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | Cartón            | 20 kg    | 03:00 PM - 05:00 PM| [foto_cajas.jpg]   | No            | [Click en Registrar] |

    Examples: Datos de salida
        | informacion                                   | mensaje_de_confirmacion           | actualizacion_de_historial                    |
        | {id: 101, material: 'Plástico', estado: 'Pendiente'} | "Material registrado con éxito."  | [Nuevo registro añadido en 'Mi Perfil']       |
        | {id: 102, material: 'Cartón', estado: 'Pendiente'}   | "Material registrado con éxito."  | [Nuevo registro añadido en 'Mi Perfil']       |

Scenario Outline: Visualización del material registrado en el historial
    Dado que el <usuario> ha registrado un material y se encuentra en el apartado <Mi_perfil>
    Cuando visualiza la sección <Entregas_y_Recojos>
    Entonces podrá ver <quien_recoge_su_material> y <a_que_hora>

    Examples: Datos de entrada
        | usuario                               | Mi_perfil    | Entregas_y_Recojos      |
        | jsm0502@gmail.com (Eco-consciente)    | "Mi Perfil"  | "Historial de Entregas" |
        | bodega.ecomart@email.com (Bodega)     | "Mi Perfil"  | "Historial de Recojos"  |

    Examples: Datos de salida
        | quien_recoge_su_material      | a_que_hora            |
        | "Juan Silva (Recolector)"     | "10:00 AM - 12:00 PM" |
        | "Pendiente de asignación"     | "03:00 PM - 05:00 PM" |
