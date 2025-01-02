import 'package:farmadev/config/theme/app_theme.dart';
import 'package:farmadev/implementacion_databases/CrearDB_impl.dart';
import 'package:farmadev/implementacion_databases/CrearUsuario_impl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //TESTING CONNECTION
  void probarConexion() {
    //   /*Para crear una conexión a la base de datos tanto como para crear un usuario,
    //   como para ingresar el usuario, se necesita crear una instancia de la clase CreardbImpl y
    //   llamar a sus métodos SignIn y logIn respectivamente. */
    CrearusuarioImpl usuario = CrearusuarioImpl();
    usuario.signIn("andrea", "andreatangogsx@gmail.com", "andrea");
  }

  @override
  Widget build(BuildContext context) {
    // probarConexion();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //el número que se le pase a AppTheme es el índice del color que se quiere seleccionar de la lista de colores
      theme: AppTheme().getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: FloatingActionButton(
            onPressed: () {},
            child: const Text("Hola mundo esto es una prueba"),
          ),
        ),
      ),
    );
  }
}
