import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:app_manejadores_estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);
    final String? nombreUsuario = usuarioService.existeUsuario?(usuarioService.usuario?.nombre):"Pagina 2";

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(nombreUsuario==null?"":nombreUsuario))
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                //TODO
                final usuario = Usuario(
                  nombre: 'Néstor',
                  edad: 25,
                  profesiones: ['Ingenieria de Sistemas', 'Profesor']
                );
                usuarioService.usuario = usuario;
              }
            ),
            if(usuarioService.existeUsuario)MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => usuarioService.cambiarEdad = 30
            ),
            if(usuarioService.existeUsuario)MaterialButton(
              child: Text('Cambiar Nombre', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => usuarioService.cambiarNombre()
            ),
            if(usuarioService.existeUsuario)MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => usuarioService.agregarProfesion()
            )
          ]
        )
     )
   );
  }
}