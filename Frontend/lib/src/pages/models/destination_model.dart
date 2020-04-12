//import 'package:flutter_travel_ui/models/activity_model.dart';
import 'package:cardinal_scout_app/src/pages/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
    Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/Vigia.png',
    city: 'Vigía',
    country: 'Italy',
    description: 'Inicia tus desafíos y recorre con éxito el camino a ser un gran Explorador Scout.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/Explorador.png',
    city: 'Explorador',
    country: 'France',
    description: 'Inicia tus desafíos y recorre con éxito el camino a ser un gran Excursionista Scout.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/Excursionista.png',
    city: 'Excursionista',
    country: 'India',
    description: 'Inicia tus desafíos y recorre con éxito el camino a ser un gran Expedicionario Scout.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/Expedicionario.png',
    city: 'Expedicionario',
    country: 'Brazil',
    description: 'Termina tus ultimos desafíos y peparate para una nueva estapa, ve y recorre nuevos caminos.',
    activities: activities,
  ),
/*   Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ), */
];
