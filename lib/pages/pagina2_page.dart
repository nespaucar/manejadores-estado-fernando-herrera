import 'package:app_manejadores_estado/bloc/usuario/usuario_cubit.dart';
import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 2')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final usuario = Usuario(
                  nombre: 'Néstor Paucar',
                  edad: 25,
                  profesiones: [
                    'Ingeniero de sistemas',
                    'Profesor'
                  ]
                );
                usuarioCubit.seleccionarUsuario(usuario);
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              }
            )
          ]
        )
     )
   );
  }
}