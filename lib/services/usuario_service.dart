import 'package:app_manejadores_estado/models/usuarios.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService with ChangeNotifier {

  // provider pone el widget en la pagina mas alta
  // para que afecte a todos sus hijos

  Usuario? _usuario;

  Usuario? get usuario => this._usuario;
  bool get existeUsuario => (this._usuario!=null?true:false);

  set usuario(Usuario? usuario) {
    this._usuario = usuario;
    notifyListeners();
  }

  set cambiarEdad(int edad) {
    this._usuario?.edad = edad;
    notifyListeners();
  }

  cambiarNombre() {
    if(this._usuario?.nombre=="Néstor") {
      this._usuario?.nombre="Karen";
     } else {
      this._usuario?.nombre="Néstor";
     }
    notifyListeners();
  }

  removeUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  agregarProfesion() {
    int? cant = this._usuario?.profesiones==null?0:(this._usuario?.profesiones?.length);
    int cant2 = (cant==null?0:cant+1);
    this._usuario?.profesiones?.add('Profesión: ${cant2}');
    notifyListeners();
  }
}