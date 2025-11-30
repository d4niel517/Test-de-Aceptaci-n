Feature: US25 - Visualización y filtro de certificados digitales por dificultad
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero visualizar el nivel de dificultad de cada certificado y filtrar los disponibles,
    Para identificar cuáles puedo obtener más fácilmente.

Scenario Outline: Visualización del nivel de dificultad de cada certificado
    Dado que el <usuario> acceda a la sección <Certificados>
    Cuando seleccione el botón <Ver_dificultad>
    Entonces el sistema deberá mostrar una <tabla_dificultad> con el nivel asignado a cada certificado y una breve descripción del esfuerzo

    Examples: Datos de entrada
        | usuario                               | Certificados          | Ver_dificultad        |
        | jsm0502@gmail.com (Eco-consciente)    | "Panel Certificados"  | [Botón Info Dificultad]|
        | bodega.ecomart@email.com (Bodega)     | "Panel Certificados"  | [Botón Info Dificultad]|

    Examples: Datos de salida
        | tabla_dificultad                                                          |
        | [Lista: "Eco-Líder (Difícil)", "Iniciador (Fácil)", "Constante (Moderado)"]|
        | [Lista: "Eco-Líder (Difícil)", "Iniciador (Fácil)", "Constante (Moderado)"]|

Scenario Outline: Filtrado de certificados por nivel de dificultad
    Dado que el <usuario> acceda a la sección <Certificados>
    Cuando seleccione un nivel dentro del filtro <Filtro_dificultad> (por ejemplo: Fácil, Moderado, Difícil)
    Entonces el sistema deberá mostrar únicamente los <certificados_filtrados> que coincidan con el nivel seleccionado

    Examples: Datos de entrada
        | usuario                   | Certificados          | Filtro_dificultad |
        | jsm0502@gmail.com         | "Panel Certificados"  | "Fácil"           |
        | bodega.ecomart@email.com  | "Panel Certificados"  | "Difícil"         |

    Examples: Datos de salida
        | certificados_filtrados                                        |
        | [Lista filtrada: "Certificado Iniciador", "Certificado Básico"]|
        | [Lista filtrada: "Certificado Eco-Líder Oro"]                 |
