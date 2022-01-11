import 'package:app_manejadores_estado/bloc/usuario/usuario_cubit.dart';
import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
        actions: [
          IconButton(
            onPressed: () => usuarioCubit.borrarUsuario(),
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      // El Builder Para Bloc Provider
      body: BodyBlocScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class BodyBlocScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        // Si hay instancia de usuario inicialn entonces no existe el usuario
        print(state);
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No Existe Usuario Inicial'));
          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          default:
            return Center(child: Text('Estado No Reconocido'));
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones.map(
            (profesion) {
              return ListTile(
                title: Text(profesion),
              );
            }
          )
        ],
      ),
    );
  }
}