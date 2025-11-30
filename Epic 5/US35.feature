Feature: US35 - Registro con correo electrónico, Google o Facebook
    Como joven eco-consciente o bodega,
    Quiero registrarme con mi correo electrónico, cuenta de Google o Facebook,
    Para acceder rápidamente a la app.

Scenario Outline: Registro con correo electrónico
    Dado que el <usuario_no_registrado> está en el <formulario_registro>
    Cuando ingresa sus <datos_registro> y realiza la <accion_presionar_registrarse>
    Entonces el sistema envía un <email_verificacion_enviado> y muestra un <mensaje_verificacion_pendiente>

    Examples: Datos de entrada
        | usuario_no_registrado                 | formulario_registro   | datos_registro                                            | accion_presionar_registrarse |
        | "Joven Eco-consciente (Nuevo)"        | "Pantalla Registro"   | "Luis, luis@mail.com, 987654321, Joven, pass123"          | [Click en Registrar]         |
        | "Bodega EcoMart (Nuevo)"              | "Pantalla Registro"   | "EcoMart, contacto@ecomart.pe, 999888777, Bodega, pass1"  | [Click en Registrar]         |

    Examples: Datos de salida
        | email_verificacion_enviado            | mensaje_verificacion_pendiente                    |
        | [Email enviado a luis@mail.com]       | "Revisa tu correo para verificar la cuenta"       |
        | [Email enviado a contacto@ecomart.pe] | "Revisa tu correo para verificar la cuenta"       |

Scenario Outline: Registro con cuenta de Google o Facebook
    Dado que el <usuario_no_registrado> está en la pantalla de registro
    Cuando realiza la <accion_elegir_google_fb> y completa el <flujo_oauth_externo> con <credenciales_oauth_validas>
    Entonces el sistema crea la <cuenta_creada_bd>, autentica al <usuario_autenticado> y lo <redireccion_home>

    Examples: Datos de entrada
        | usuario_no_registrado | accion_elegir_google_fb       | flujo_oauth_externo   | credenciales_oauth_validas |
        | "Joven Eco-consciente"| [Click "Registrarse con Google"] | [Pop-up Google]       | "Token válido Google"      |
        | "Bodega EcoMart"      | [Click "Registrarse con FB"]     | [Pop-up Facebook]     | "Token válido Facebook"    |

    Examples: Datos de salida
        | cuenta_creada_bd              | usuario_autenticado   | redireccion_home      |
        | [Perfil creado en BD]         | [Sesión iniciada]     | [Redirige a "Home"]   |
        | [Perfil creado en BD]         | [Sesión iniciada]     | [Redirige a "Home"]   |

Scenario Outline: Error de registro
    Dado que el <usuario_no_registrado> intenta registrarse
    Cuando realiza la <accion_intentar_registro> bajo una <condicion_error> (ej. <datos_incompletos> o <correo_ya_registrado>)
    Entonces la aplicación debe mostrar un <mensaje_error_especifico>

    Examples: Datos de entrada
        | usuario_no_registrado | accion_intentar_registro  | condicion_error       | datos_incompletos     | correo_ya_registrado      |
        | "Usuario Nuevo"       | [Click Registrar]         | "Campos vacíos"       | [Nombre vacío]        | N/A                       |
        | "Usuario Existente"   | [Click Registrar]         | "Email duplicado"     | N/A                   | "luis@mail.com (Existe)"  |

    Examples: Datos de salida
        | mensaje_error_especifico      |
        | "Faltan campos obligatorios"  |
        | "Este correo ya está en uso"  |
