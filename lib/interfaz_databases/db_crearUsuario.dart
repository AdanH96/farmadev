abstract class DbCrearusuario {
  int? idUsuario;
  String? nombre;
  String? email;
  String? contrasena;

  DbCrearusuario(
      {int? id,
      String? nombre,
      required String email,
      required String contrasena}) {
    idUsuario = id;
    nombre = nombre;
    email = email;
    contrasena = contrasena;
  }

  DbCrearusuario SignIn(String nombre, String email, String contrasena);
  DbCrearusuario logIn(String email, String contrasena);

  //TODO NECESITO QUE SIGNIN SEA UN INSERT DE DATOS, Y LOGIN UNA CONSULTA. No necesito implementar nada más de momento
}
