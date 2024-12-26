//clase abstracta de la conexión para registrar y loggear como Usuario. (INTERFAZ)

abstract class DbCrearusuario {
  int? _idUsuario;
  String? _nombre;
  String? _email;
  String? _contrasena;

  DbCrearusuario(
      {int? id,
      String? nombre,
      required String email,
      required String contrasena}) {
    _idUsuario = id;
    _nombre = nombre;
    _email = email;
    _contrasena = contrasena;
  }

  int getIdUsuario() {
    return _idUsuario ?? 0;
  }

  String getNombreUsuario() {
    return _nombre ?? "default";
  }

  String getEmailUsuario() {
    return _email ?? "default";
  }

  String getContrasenaUsuario() {
    return _contrasena ?? "default";
  }

  Future signIn(String nombre, String email, String contrasena);
  Future logIn(String email, String contrasena);

  //TODO NECESITO QUE SIGNIN SEA UN INSERT DE DATOS, Y LOGIN UNA CONSULTA. No necesito implementar nada más de momento
}
