//import 'package:flutter_travel_ui/models/activity_model.dart';
import 'package:cardinal_scout_app/src/pages/models/activity_model.dart';

class Block {
  String imageUrl;
  String nombre;
  String country;
  String description;
  List<Activity> activities;

  Block({
    this.imageUrl,
    this.nombre,
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
];

List<Block> blocks = [
  Block(
    imageUrl: 'assets/images/Vigia.png',
    nombre: 'Vigía',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Block(
    imageUrl: 'assets/images/Explorador.png',
    nombre: 'Explorador',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Block(
    imageUrl: 'assets/images/Excursionista.png',
    nombre: 'Excursionista',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Block(
    imageUrl: 'assets/images/Expedicionario.png',
    nombre: 'Expedicionario',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  
];
