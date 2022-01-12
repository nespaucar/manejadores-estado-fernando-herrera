import 'package:app_manejadores_estado/controllers/usuario_controller.dart';
import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {}
          )
        ],
      ),
      // Observable que ve que los cambios se den
      body: Obx(
        () => userCtrl.existeUsuario.value
          ? InformacionUsuario(usuario: userCtrl.usuario.value)
          : const NoUsuario(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () { 
          //Forma tradicional
          //Navigator.pushNamed(context, 'pagina2');
          //Forma para enviar el widget
          //Get.to(Pagina2Page());
          //Forma para enviar la ruta
          Get.toNamed('pagina2', arguments: {
            'nombre': 'Néstor Paucar',
            'Edad': 25,
          });
        }
     ),
   );
  }
}

class NoUsuario extends StatelessWidget {
  const NoUsuario({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('No Existe Usuario'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({
    Key? key,
    required this.usuario
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones.map((prof) => 
            ListTile(
              title: Text(prof),
            )
          )
        ],
      ),
    );
  }
}