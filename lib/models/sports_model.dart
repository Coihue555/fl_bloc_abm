class SportsModel {
   int? id;
   String nombre;
   String descripcion;

  SportsModel({
    this.id ,
    required this.nombre,
    this.descripcion = ''
  });

    SportsModel copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    }) => SportsModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion
    );

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion
      };
}
