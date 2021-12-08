class Recipe {
  final String? description; //name;
  final String? images;
  final int? precio; //rating;
  final String? nombre; //totalTime;

  Recipe({this.description, this.images, this.precio, this.nombre});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        description: json['descripcion'] as String,
        images: json['url_imagen'] as String,
        precio: json['precio'] as int,
        nombre: json['nombre'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {description: $description, image; $images, precio: $precio, nombre: $nombre}';
  }
}
