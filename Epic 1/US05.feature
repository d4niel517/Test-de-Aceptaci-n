Feature: US05 - Validación de información registrada (Evidencia Visual)
    Como joven eco-consciente o bodega/pequeño comercio,
    Quiero recibir una confirmación visual cuando mi registro haya sido guardado correctamente,
    Para asegurarme de que la información fue validada por el sistema.

Scenario Outline: Registro con evidencia visual exitosa
    Dado que el <usuario> se encuentra en el apartado <Registrar_material>
    Cuando seleccione la opción <Foto> y cargue correctamente la imagen del <material_reciclable>
    Y presione el botón <Adjuntar>
    Entonces el sistema mostrará una vista previa y el mensaje de confirmación <imagen_subida_con_exito>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | Foto              | material_reciclable   | Adjuntar            |
        | jsm0502@gmail.com (Eco-consciente)    | "Registrar Material"  | [Click en subir]  | [foto_botellas.jpg]   | [Click en Adjuntar] |
        | bodega.ecomart@email.com (Bodega)     | "Registrar Material"  | [Click en subir]  | [foto_carton.png]     | [Click en Adjuntar] |

    Examples: Datos de salida
        | imagen_subida_con_exito                                     |
        | "Enhorabuena, la imagen adjuntada se ha subido con éxito."  |
        | "Enhorabuena, la imagen adjuntada se ha subido con éxito."  |

Scenario Outline: Error al adjuntar archivo (Tamaño o Formato)
    Dado que el <usuario> se encuentra en <Registrar_material>
    Cuando seleccione <Foto> y el archivo exceda el <tamano_maximo_permitido> o tenga un <formato_no_compatible>
    Entonces el sistema deberá mostrar el <mensaje_error_formato_tamano>

    Examples: Datos de entrada
        | usuario                               | Registrar_material    | Foto                  | tamano_maximo_permitido | formato_no_compatible |
        | jsm0502@gmail.com                     | "Registrar Material"  | [video_pesado.mp4]    | 5 MB                    | .mp4                  |
        | bodega.ecomart@email.com              | "Registrar Material"  | [archivo_exe.exe]     | 5 MB                    | .exe                  |

    Examples: Datos de salida
        | mensaje_error_formato_tamano              |
        | "Error: formato o tamaño no permitido."   |
        | "Error: formato o tamaño no permitido."   |
