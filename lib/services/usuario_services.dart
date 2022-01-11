import 'dart:async';
import 'package:app_manejadores_estado/models/usuarios.dart';

class _UsuarioService {
  Usuario? _usuario;
  StreamController<Usuario?> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  Usuario? get usuario => this._usuario;
  bool? get existeUsuario => (this._usuario != null) ? true : false;

  // ESTE STREAM SIRVE PARA ACTUALIZAR EL ESTADO DE LA PÁGINA
  Stream<Usuario?> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int? edad) {
    this._usuario?.edad = edad;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose() {
    this._usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();