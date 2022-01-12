import 'package:app_manejadores_estado/bloc/user/user_bloc.dart';
import 'package:app_manejadores_estado/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                  nombre: 'Néstor Paucar',
                  edad: 25,
                  profesiones: ['Ingeniero de sistemas', 'Profesor']
                );
                // Llamo al evento para setear el usuario
                userBloc.add(ActivateUser(newUser));
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newAge = 30;
                // Llamo al evento para setear el usuario
                userBloc.add(ChangeUserAge(30));
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfession());
              }
            )
          ]
        )
     )
   );
  }
}