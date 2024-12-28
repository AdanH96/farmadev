import 'dart:math';

import 'package:farmadev/implementacion_databases/CrearDB_impl.dart';
import 'package:farmadev/interfaz_databases/db_crearUsuario.dart';

//clase que implementa la interfaz de registro y loggeo de usuario

class CrearusuarioImpl extends DbCrearusuario {
  int? _idUsuario;
  String? _nombre;
  String? _email;
  String? _contrasena;
  //para asegurar que la conexión sea única implementamos una referencia a crear
  late final CreardbImpl conexion;
  //para verificar si la conexión cumple implementamos una bandera
  bool conexionCreada = false;

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

  @override
  Future signIn(String nombre, String email, String contrasena) async {
    CrearusuarioImpl nuevoUsuario =
        CrearusuarioImpl(email: email, contrasena: contrasena);

    try {
      conexion.crearConexion();
      if (conexion.conexionCreada) {
        await conexion.connection.query(
          //evita injección sql el @ y el substitutionValues
          "INSERT INTO usuario (nombre, email, contrasena) VALUES (@nombre, @email, @contrasena)",
          substitutionValues: {
            'nombre': nombre,
            'email': email,
            'contrasena': contrasena,
          },
        );
        print("Usuario creado con éxito.");
      } else {
        print("Error al crear usuario.");
      }
    } catch (e) {
      e.toString();
    } finally {
      if (conexion.conexionCreada) {
        await conexion.cerrarConexion();
      }
    }
    return nuevoUsuario;
  }

  @override
  Future<void> logIn(String email, String contrasena) async {
    try {
      await conexion.crearConexion();

      if (conexion.conexionCreada) {
        var resultado = await conexion.connection.query(
            "SELECT * FROM usuario WHERE email = @email AND contrasena = @contrasena",
            substitutionValues: {
              'email': email,
              'contrasena': contrasena,
            });

        // Verificar si hay resultados en la propiedad rows
        if (resultado.isNotEmpty) {
          print("Usuario loggeado con éxito.");
        } else {
          print("Error al loggear usuario: Credenciales incorrectas.");
        }
      } else {
        print("No se pudo conectar a la base de datos.");
      }
    } catch (e) {
      print("Error durante el inicio de sesión: $e");
    } finally {
      // Asegurarse de cerrar la conexión
      if (conexion.conexionCreada) {
        await conexion.cerrarConexion();
      }
    }
  }

  @override
  Future deleteAccount(String email, String contrasena) async {
    //TODO Implementar si el usuario quiere eliminar su cuenta
    // para hacerlo, hay que crear una interfaz y donde mapear email y contraseña, si se cumple la condición, se elimina la cuenta
    //no hay que implementar una verificacion porque solamente el usuario sabe su email y contraeña.
    try {
      conexion.crearConexion();
      if (conexion.conexionCreada) {
        await conexion.connection.query(
          "DELETE FROM usuario WHERE email = @email AND contrasena = @contrasena",
          substitutionValues: {
            'email': email,
            'contrasena': contrasena,
          },
        );
        print("Usuario eliminado con éxito.");
      } else {
        print("Error al eliminar usuario.");
      }
    } finally {
      if (conexion.conexionCreada) {
        await conexion.cerrarConexion();
      }
    }
  }

  @override
  Future updateAccount(String email) {
    //TODO Implementar si el usuario se ha olvidado de la contraseña
    throw UnimplementedError;
  }
}

/* PARA CREAR AHORA UN USUARIO, SE DEBE HACER LO SIGUIENTE:

  CrearusuarioImpl nuevoUsuario = CrearusuarioImpl(email: EMAIL, NOMBRE , CONTRASENA);
  y para implmentar el signin se deben utilizar los getters de nuevoUsuario para obtener los datos del usuario;

  por ejemplo: nuevoUsuario.signin(nuevousuario.getNombreUsuario(), nuevoUsuario.getEmailUsuario(), nuevoUsuario.getContrasenaUsuario());

  */

/* LAS FUNCIONES DE CREAR USUARIO Y LOGGEO TIENEN UN MÉTODO DE MAPEO CON @ Y SUBSTITUTO DE VALORES PARA EVITAR SQL INJECTION,
  LAS CONSULTAS PUEDEN SER MODIFICADAS DESDE FUERA, Y CON ESTE MAPA ES IMPOSIBLE HACER UNA INYECCIÓN SQL */
