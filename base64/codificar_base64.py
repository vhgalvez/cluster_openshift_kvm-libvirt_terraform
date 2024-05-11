import base64

# Leer texto desde un archivo para codificarlo
with open('base64/archivo_para_codificar.txt', 'r') as file:
    texto_a_codificar = file.read().strip()

# Codificar el texto a base64
texto_codificado_bytes = base64.b64encode(texto_a_codificar.encode('utf-8'))

# Convertir bytes a string
texto_codificado = texto_codificado_bytes.decode('utf-8')

# Guardar el texto codificado en un archivo, añadiendo al contenido existente
with open('base64/archivo_codificado_new.txt', 'a') as file:
    file.write(texto_codificado)
    file.write('\n')  # Añade un salto de línea para separar los contenidos