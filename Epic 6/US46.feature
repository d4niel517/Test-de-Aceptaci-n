Feature: US46 - Descargar comprobantes digitales (PDF/CSV)
    Como joven eco-consciente o bodega,
    Quiero descargar comprobantes detallados de cada recojo,
    Para contabilidad, reembolsos o registros.

Scenario Outline: El usuario descarga un comprobante de pago
    Dado que el <usuario_autenticado> está en el <apartado_historial_actividades> y selecciona un <item_recoleccion_especifico> (con sus <datos_recoleccion>)
    Cuando realiza la <accion_presionar_pdf_csv>
    Entonces la app genera un <archivo_generado> (con <datos_en_archivo>) e inicia la <inicio_descarga>

    Examples: Datos de entrada
        | usuario_autenticado                   | apartado_historial_actividades | item_recoleccion_especifico   | datos_recoleccion             | accion_presionar_pdf_csv  |
        | bodega.ecomart@email.com (Bodega)     | "Pantalla Historial"           | "Recojo #101 - Plástico"      | "Fecha: 20/11, Peso: 20kg"    | [Click en ícono PDF]      |
        | jsm0502@gmail.com (Eco-consciente)    | "Pantalla Historial"           | "Entrega #50 - Vidrio"        | "Fecha: 15/11, Peso: 5kg"     | [Click en ícono CSV]      |

    Examples: Datos de salida
        | archivo_generado      | datos_en_archivo                      | inicio_descarga                       |
        | "Comprobante_101.pdf" | "Detalle: 20kg Plástico, S/ 10.00"    | [Sistema inicia descarga del archivo] |
        | "Registro_50.csv"     | "15/11/2024, Vidrio, 5kg"             | [Sistema inicia descarga del archivo] |

Scenario Outline: El usuario descarga todos los comprobantes de pago
    Dado que el <usuario_autenticado> está en el <apartado_historial_actividades> viendo la <lista_actividades_visibles>
    Cuando realiza la <accion_presionar_descargar_todo>
    Entonces la app inicia el <proceso_generacion_zip>, crea el <archivo_zip_generado> e inicia la <inicio_descarga_zip>

    Examples: Datos de entrada
        | usuario_autenticado   | apartado_historial_actividades | lista_actividades_visibles    | accion_presionar_descargar_todo |
        | bodega.ecomart        | "Pantalla Historial"           | [Lista filtrada: Noviembre]   | [Click en "Descargar todo"]     |
        | jsm0502               | "Pantalla Historial"           | [Lista completa: 2024]        | [Click en "Descargar todo"]     |

    Examples: Datos de salida
        | proceso_generacion_zip    | archivo_zip_generado          | inicio_descarga_zip                   |
        | [Loader: "Compilando..."] | "Comprobantes_Noviembre.zip"  | [Sistema inicia descarga del ZIP]     |
        | [Loader: "Compilando..."] | "Historial_Completo_2024.zip" | [Sistema inicia descarga del ZIP]     |
