import psycopg2

# Parámetros de la base de datos
dbname = 'IVA'
host = 'localhost'
port = '5432'
user = 'postgres'
password = '2020'

# Establecer la conexión a la base de datos
conn = psycopg2.connect(dbname=dbname, host=host, port=port, user=user, password=password)

continuar = True

while continuar:
    # Código de IVA
    try:
        precio = float(input('Ingrese el precio de su producto: Q'))
    except ValueError:
        print('Error: Ingrese un valor numérico para el precio.')
        continue

    iva = precio * 0.12
    precio_sin_iva = precio - iva

    print(f'El precio sin IVA es de Q{precio_sin_iva:.0f}, el IVA es de Q{iva:.0f}')

    try:
        # Construir la instrucción SQL para la inserción
        ins1 = 'INSERT INTO codigo (precio) VALUES ('
        ins2 = ');'
        instruccion = f'{ins1}{precio}{ins2}'

        # Ejecutar la instrucción SQL
        with conn.cursor() as cursor:
            cursor.execute(instruccion)
            conn.commit()

    except Exception as e:
        # Mostrar información detallada sobre el error
        print(f'Error durante la conexión a la DB. Detalles del error: {str(e)}')

    # Preguntar al usuario si desea ingresar otro precio
    respuesta = input('¿Desea ingresar otro precio? (si/no): ').strip().lower()

    # Verificar la respuesta del usuario
    if respuesta != 'si':
        continuar = False

# Cerrar la conexión a la base de datos
conn.close()
