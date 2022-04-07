class SportsModel {
   int? id;
   String nombre;
   String descripcion;

  SportsModel({
    this.id ,
    required this.nombre,
    this.descripcion = ''
  });

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
