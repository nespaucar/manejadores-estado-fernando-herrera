import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:app_manejadores_estado/services/usuario_services.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatefulWidget {
  @override
  State<Pagina2Page> createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {

  late Usuario? usuario;
  late Stream<Usuario?> usuarioStream;

  @override
  void initState() {
    usuario = usuarioService.usuario;
    usuarioStream = usuarioService.usuarioStream;
    print(usuario);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: StreamBuilder(
            stream: usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario?> snapshot){
              return usuario!=null||snapshot.hasData
                ? Text('Nombre: ${ (usuario?.nombre==null?snapshot.data?.nombre:usuario?.nombre) }')
                : Text('Pagina 2');
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = new Usuario( nombre: 'Fernando', edad: 35 );
                usuarioService.cargarUsuario(nuevoUsuario);
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                //TODO
              }
            )
          ]
        )
     )
   );
  }
}