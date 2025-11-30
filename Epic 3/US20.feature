Feature: US20 - Certificados digitales
    Como bodega,
    Quiero recibir un certificado digital por mis aportes dentro de la app,
    Para aumentar la credibilidad de mi negocio.

Scenario Outline: Visualizar certificados digitales disponibles y sus requisitos
    Dado que la <bodega> desea ver los certificados disponibles y se dirige al apartado <Incentivos>
    Cuando se encuentre en la sección <Certificados> y seleccione <Ver>
    Entonces el sistema mostrará el <nombre_certificado> y los <requisitos_de_obtencion>

    Examples: Datos de entrada
        | bodega                                | Incentivos            | Certificados          | Ver             |
        | bodega.ecomart@email.com (Bodega)     | "Sección Incentivos"  | "Panel Certificados"  | [Click en Ver]  |
        | tienda.pepe@email.com (Bodega)        | "Sección Incentivos"  | "Panel Certificados"  | [Click en Ver]  |

    Examples: Datos de salida
        | nombre_certificado            | requisitos_de_obtencion                   |
        | "Certificado Eco-Líder Oro"   | "Acumular 5000 puntos en un año"          |
        | "Certificado Colaborador"     | "Realizar 50 recolecciones verificadas"   |

Scenario Outline: Generar certificado digital
    Dado que la <bodega> desee generar un <certificado_digital> y se encuentre en la sección <Certificados_Digitales>
    Cuando presione el botón <Canjear>
    Entonces el sistema validará si cumple los <requisitos_solicitados>
    Y añadirá el certificado a su <perfil> y permitirá al usuario descargar el <archivo_PDF>

    Examples: Datos de entrada
        | bodega                    | certificado_digital           | Certificados_Digitales    | Canjear             |
        | bodega.ecomart@email.com  | "Certificado Eco-Líder Oro"   | [Detalle del certificado] | [Click en Canjear]  |
        | tienda.pepe@email.com     | "Certificado Colaborador"     | [Detalle del certificado] | [Click en Canjear]  |

    Examples: Datos de salida
        | requisitos_solicitados    | perfil                        | archivo_PDF                   |
        | "Requisitos cumplidos"    | [Insignia añadida al perfil]  | "certificado_oro.pdf"         |
        | "Requisitos cumplidos"    | [Insignia añadida al perfil]  | "certificado_colaborador.pdf" |
