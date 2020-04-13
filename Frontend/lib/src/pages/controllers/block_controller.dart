import 'package:cardinal_scout_app/src/pages/models/block_model.dart';
import 'package:cardinal_scout_app/src/pages/models/activity_model.dart';
import 'package:cardinal_scout_app/src/pages/repositories/block_repository.dart';

/* import 'package:revoxfood/src/models/category.dart';
import 'package:revoxfood/src/models/food.dart';
import 'package:revoxfood/src/models/restaurant.dart';
import 'package:revoxfood/src/models/review.dart';
import 'package:revoxfood/src/repository/category_repository.dart';
import 'package:revoxfood/src/repository/food_repository.dart';
import 'package:revoxfood/src/repository/restaurant_repository.dart';
import 'package:revoxfood/src/repository/settings_repository.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart'; */




class BlockController extends ControllerMVC {
  List<Activity> activities = <Activity>[];
  //List<Restaurant> topRestaurants = <Restaurant>[];
  //List<Review> recentReviews = <Review>[];
  //List<Food> trendingFoods = <Food>[];

  BlockController() {
    listenForActivities();
    //listenForTopRestaurants();
    //listenForRecentReviews();
    //listenForTrendingFoods();
  }

  void listenForCategories() async {
    final Stream<Activity> stream = await getActivities();
    stream.listen((Activity _category) {
      setState(() => activities.add(_category));
    }, onError: (a) {}, onDone: () {});
  }

/*   void listenForTopRestaurants() async {
    getCurrentLocation().then((LocationData _locationData) async {
      final Stream<Restaurant> stream = await getNearRestaurants(_locationData, _locationData);
      stream.listen((Restaurant _restaurant) {
        setState(() => topRestaurants.add(_restaurant));
      }, onError: (a) {}, onDone: () {});
    });
  }

  void listenForRecentReviews() async {
    final Stream<Review> stream = await getRecentReviews();
    stream.listen((Review _review) {
      setState(() => recentReviews.add(_review));
    }, onError: (a) {}, onDone: () {});
  }

  void listenForTrendingFoods() async {
    final Stream<Food> stream = await getTrendingFoods();
    stream.listen((Food _food) {
      setState(() => trendingFoods.add(_food));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  } */

  Future<void> refreshHome() async {
    activities = <Activity>[];
    //topRestaurants = <Restaurant>[];
    //recentReviews = <Review>[];
    //trendingFoods = <Food>[];
    
    
    listenForActivities();
    
    
    //listenForTopRestaurants();
    //listenForRecentReviews();
    //listenForTrendingFoods();
  }
}
