import 'package:postgres/postgres.dart';

// Clase para manejar la conexión con PostgreSQL
class CreardbImpl {
  final String _direccionServidor = 'localhost';
  final String _nombreDB = 'farmadevPSQL';
  final int _puerto = 5433;
  final String _usuarioDB = 'postgres';
  final String _contrasenaDB = '2134';

  // Implementación de la conexión pra asegurar que sea única y bandera para verificar si la conexión cumple
  late PostgreSQLConnection connection;
  bool conexionCreada = false;

  // Método para crear conexión
  Future<void> crearConexion() async {
    try {
      // Crear la conexión con los parámetros necesarios
      connection = PostgreSQLConnection(
        _direccionServidor,
        _puerto,
        _nombreDB,
        username: _usuarioDB,
        password: _contrasenaDB,
      );

      // Abrir la conexión
      await connection.open();

      // Establecer el search_path al esquema deseado
      await connection.query('SET search_path TO information_schema');

      // Si no lanza excepción, la conexión fue exitosa
      conexionCreada = true;
      print("Conexión creada con éxito.");
    } catch (e) {
      // Si ocurre un error, marcar como fallida
      conexionCreada = false;
      print("Error al conectar a la base de datos: $e");
    }
  }

  // Método para cerrar la conexión
  Future<void> cerrarConexion() async {
    if (conexionCreada) {
      await connection.close();
      conexionCreada = false;
      print("Conexión cerrada.");
    }
  }
}
