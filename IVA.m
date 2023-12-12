pkg load database

% Parámetros de la base de datos
%"IVA" se tiene que cambiar por el nombre de la base de datos

conn = pq_connect(setdbopts('dbname', 'IVA', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', '2020'));

continuar = true;

while continuar
    % Código de IVA
    precio = input('Ingrese el precio de su1 producto: Q');
    % Validar la entrada del usuario (asegurarse de que sea un número)
    if ~isnumeric(precio)
        disp('Error: Ingrese un valor numérico para el precio.');
        continue;
    end

    IVA = precio * 0.12;
    precio_sin_iva = precio - IVA;

    fprintf('El precio sin IVA es de Q%0.0f, el IVA es de Q%0.0f\n', precio_sin_iva, IVA);

    try
        % Construir la instrucción SQL para la inserción
        % "Codigo" nombre de la tabla
        % " (Presio) " nombre de la columna de la tabla
        Ins1 = 'INSERT INTO codigo (precio) VALUES (';
        Ins2 = ');';
        Instruccion = strcat(Ins1, num2str(precio), Ins2);

        % Ejecutar la instrucción SQL
        Registro = pq_exec_params(conn, Instruccion);

    catch e
        % Mostrar información detallada sobre el error
        disp(['Error durante la conexión a la DB. Detalles del error: ' e.identifier]);
        disp(e.message);
    end

    % Preguntar al usuario si desea ingresar otro precio
    respuesta = input('¿Desea ingresar otro precio? (si/no): ', 's');

    % Verificar la respuesta del usuario
    if ~strcmpi(respuesta, 'si')
        continuar = false;
    end
end

% Cerrar la conexión a la base de datos
pq_disconnect(conn);
