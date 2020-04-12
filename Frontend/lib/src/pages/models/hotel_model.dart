class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/Corporalidad.png',
    name: 'Corporalidad',
    address: '404 Great St',
    price: 80,
  ),
  Hotel(
    imageUrl: 'assets/images/Creatividad.png',
    name: 'Creatividad',
    address: '404 Great St',
    price: 50,
  ),
  Hotel(
    imageUrl: 'assets/images/Caracter.png',
    name: 'Caracter',
    address: '404 Great St',
    price: 20,
  ),
   Hotel(
    imageUrl: 'assets/images/Afectividad.png',
    name: 'Afectividad',
    address: '404 Great St',
    price: 60,
  ),
   Hotel(
    imageUrl: 'assets/images/Sociabilidad.png',
    name: 'Sociabilidad',
    address: '404 Great St',
    price: 70,
  ),
   Hotel(
    imageUrl: 'assets/images/Espritualidad.png',
    name: 'Espritualidad',
    address: '404 Great St',
    price: 75,
  ),
];
