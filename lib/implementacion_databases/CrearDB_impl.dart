import 'package:farmadev/interfaz_databases/db_crearConexion.dart';
import 'package:postgres/postgres.dart';

//clase que implementa la interfaz de crearConexion e implementa los métodos.

class CreardbImpl extends DbCrearconexion {
  @override
  String direccionServidor = "localhost";
  @override
  String nombreDB = "information_schema";
  @override
  int puerto = 5433;
  @override
  String usuarioDB = "postgres";
  @override
  String contrasenaDB = "2134";
  late final Connection conn;

  CreardbImpl(String direccion, String nombre, int puerto, String usuarioDB,
      String contrasena)
      : super(
            direccionServidor: direccion,
            nombreDB: nombre,
            puerto: puerto,
            usuarioDB: usuarioDB,
            contrasenaDB: contrasena);

  Future crearConexion() async {
    final conn = await Connection.open(
      Endpoint(
        host: direccionServidor,
        database: nombreDB,
        username: usuarioDB,
        password: contrasenaDB,
      )

      // si la conexión es a través de internet hay que activar el SSL, SSL -> verifyFull
      ,
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );

    return conn;
  }
}
