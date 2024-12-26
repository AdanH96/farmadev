//clase abstracta para detallar propiedades y métodos de la conexión (INTERFAZ)

abstract class DbCrearconexion {
  String direccionServidor = "default";
  String nombreDB = "default";
  int puerto = 0000;
  String usuarioDB = "default";
  String contrasenaDB = "default";

  DbCrearconexion(
      {required this.direccionServidor,
      required this.puerto,
      required this.nombreDB,
      required this.usuarioDB,
      required this.contrasenaDB});
}
