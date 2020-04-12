class Category {
  String imageUrl;
  String name;
  double porcentaje;

  Category({
    this.imageUrl,
    this.name,
    this.porcentaje,
  });
}

final List<Category> categorys = [
  Category(
    imageUrl: 'assets/images/Corporalidad.png',
    name: 'corporalidad',
    porcentaje: 80.5,
  ),
  Category(
    imageUrl: 'assets/images/Creatividad.png',
    name: 'Creatividad',
    porcentaje: 50,
  ),
  Category(
    imageUrl: 'assets/images/Caracter.png',
    name: 'Caracter',
    porcentaje: 20,
  ),
   Category(
    imageUrl: 'assets/images/Afectividad.png',
    name: 'Afectividad',
    porcentaje: 60,
  ),
   Category(
    imageUrl: 'assets/images/Sociabilidad.png',
    name: 'Sociabilidad',
    porcentaje: 70,
  ),
   Category(
    imageUrl: 'assets/images/Espritualidad.png',
    name: 'Espritualidad',
    porcentaje: 75,
  ),
];
