import 'package:app_manejadores_estado/controllers/usuario_controller.dart';
import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Obtenemos los parámetros que se han enviado
    //print(Get.arguments['nombre']);

    final userCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCtrl.setUsuario(Usuario(nombre: 'Néstor Paucar', edad: 30));
              }
            ),
            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCtrl.updateEdadUsuario(40);
              }
            ),
            MaterialButton(
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCtrl.addProfesionUsuario();
              }
            ),
            MaterialButton(
              child: const Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              // Para cambiar tema fácilmente con GetX
              onPressed: () => Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark())
            )
          ]
        )
     )
   );
  }
}