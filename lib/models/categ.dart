class Categ {
  final String? description; //name;
  final String? images;
  final String? nombre; //totalTime;
  final int? id; //rating;

  Categ({this.description, this.images, this.nombre, this.id});

  factory Categ.fromJson(dynamic json) {
    return Categ(
        description: json['descripcion'] as String,
        images: json['url_imagen'] as String,
        nombre: json['nombre'] as String,
        id: json['id'] as int);
  }

  static List<Categ> categsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Categ.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Categ {description: $description, image; $images, nombre: $nombre; id: $id}';
  }
}
