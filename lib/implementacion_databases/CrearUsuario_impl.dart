import 'package:farmadev/interfaz_databases/db_crearUsuario.dart';

//clase que implementa la interfaz de registro y loggeo de usuario

class CrearusuarioImpl extends DbCrearusuario {
  int? _idUsuario;
  String? _nombre;
  String? _email;
  String? _contrasena;

  CrearusuarioImpl({
    int? id,
    String? nombre,
    required String email,
    required String contrasena,
  }) : super(
          id: id,
          nombre: nombre,
          email: email,
          contrasena: contrasena,
        );

  @override
  int getIdUsuario() {
    return _idUsuario ?? 0;
  }

  @override
  String getNombreUsuario() {
    return _nombre ?? "default";
  }

  @override
  String getEmailUsuario() {
    return _email ?? "default";
  }

  @override
  String getContrasenaUsuario() {
    return _contrasena ?? "default";
  }

//TODO: en el signin hay que llamar a la conexion creada en la clase crearDB impl
  @override
  Future signIn(String nombre, String email, String contrasena) async {
    CrearusuarioImpl nuevoUsuario =
        CrearusuarioImpl(email: email, contrasena: contrasena);

    try {} catch (Exception) {
      Exception.toString();
    }
  }

  @override
  Future logIn(String email, String contrasena) {
    // TODO: implement logIn
    throw UnimplementedError();
  }
}

@override
Future logIn(String email, String contrasena) async {
  throw UnimplementedError;
}
