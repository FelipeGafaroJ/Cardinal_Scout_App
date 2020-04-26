
import 'package:cardinalscout/src/repository/search_repository.dart';
import 'package:cardinalscout/src/repository/settings_repository.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SearchController extends ControllerMVC {
  /*
  List<Restaurant> restaurants = <Restaurant>[];

  SearchController() {
    listenForRestaurants();
  }

  void listenForRestaurants({String search}) async {
    if (search == null) {
      search = await getRecentSearch();
    }
    LocationData _locationData = await getCurrentLocation();
    final Stream<Restaurant> stream = await searchRestaurants(search, _locationData);
    stream.listen((Restaurant _restaurant) {
      setState(() => restaurants.add(_restaurant));
    }, onError: (a) {}, onDone: () {});
  }

  Future<void> refreshSearch(search) async {
    restaurants = <Restaurant>[];
    listenForRestaurants(search: search);
  }

  void saveSearch(String search) {
    setRecentSearch(search);
  }*/
}
