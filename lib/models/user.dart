class User {  
  String? nombre;
  int? edad;
  List<String>? profesiones;

  User({
    this.nombre,
    this.edad,
    this.profesiones
  });

  copyWith({
    String? newNombre,
    int? newEdad,
    List<String>? newProfesiones
  }) => User(
    nombre: newNombre ?? this.nombre,
    edad: newEdad ?? this.edad,
    profesiones: newProfesiones ?? this.profesiones
  );
}