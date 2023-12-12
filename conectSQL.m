function conectSQL()

  pkg load database
  %"IVA" es el database se tiene que camiar
  conn = pq_connect(setdbopts('dbname', 'IVA', 'host','localhost','port','5432','user','postgres','password','2020'));

  try
    disp("Datos obtenidos");
    Instruccion = "select * from codigo;"; %"valor" nombre de la tabla

    conn = pq_connect(setdbopts('dbname', 'IVA', 'host','localhost','port','5432','user','postgres','password','2020'));
    Registro = pq_exec_params(conn, Instruccion);

    [FilasR columnasR] = size(Registro.data);
    Registro.data

  catch e
    disp(['Error durante la conexion a la DB, consulte sobre el error: ' e.message]);
  end

  end
