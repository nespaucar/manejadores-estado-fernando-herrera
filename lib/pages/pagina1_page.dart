import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:app_manejadores_estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
        actions: [
          IconButton(
            onPressed: () => usuarioService.removeUsuario(),
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: (usuarioService.existeUsuario
        ? InformacionUsuario(usuario: usuarioService.usuario)
        : Center(
          child: Text('No existe el usuario'),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;

  const InformacionUsuario({
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${this.usuario?.nombre}')),
          ListTile(title: Text('Edad: ${this.usuario?.edad}')),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          if(usuario?.profesiones!=null)...usuario!.profesiones!.map(
            (profesion) => ListTile(
              title: Text(profesion),
            )
          ).toList()
        ],
      ),
    );
  }
}