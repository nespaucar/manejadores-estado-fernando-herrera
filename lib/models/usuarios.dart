class Usuario {  
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    required this.profesiones
  });

  Usuario copiarUsuario({
    String? nombreC,
    int? edadC,
    List<String>? profesionesC
  }) {
    return Usuario(
      nombre: nombreC ?? this.nombre,
      edad: edadC ?? this.edad,
      profesiones: profesionesC ?? this.profesiones,
    );
  }
}