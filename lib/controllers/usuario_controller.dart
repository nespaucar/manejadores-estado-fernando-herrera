import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  int get profesionesTotal {
    return this.usuario.value.profesiones.length;
  }

  setUsuario(Usuario usuario) {
    this.existeUsuario.value = true;
    this.usuario.value = usuario;
  }

  updateEdadUsuario(int edad) {
    if(!this.existeUsuario.value) return;
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }

  addProfesionUsuario() {
    if(!this.existeUsuario.value) return;
    final profesiones = [...this.usuario.value.profesiones, 'Profesión: ${this.profesionesTotal + 1}'];
    this.usuario.update((val) {
      val!.profesiones = profesiones;
    });
  }
}