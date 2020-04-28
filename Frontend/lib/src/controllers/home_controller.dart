import 'package:com.cardinalscout/src/models/activity.dart';
import 'package:com.cardinalscout/src/models/block.dart';
import 'package:com.cardinalscout/src/models/category.dart';
import 'package:com.cardinalscout/src/repository/block_repository.dart';
import 'package:com.cardinalscout/src/repository/category_repository.dart';
import 'package:com.cardinalscout/src/repository/activity_repository.dart';
//import 'package:com.cardinalscout/src/repository/settings_repository.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {

  List<Block> blocks = <Block>[];
  List<Activity> activitys = <Activity>[];
  List<Category> categories = <Category>[];

  HomeController() {
    listenForBlocks();
    //listenForActivitys();
    listenForCategorys();
  }

  void listenForBlocks() async {
    final Stream<Block> stream = await getBlocks();
    stream.listen((Block _block) {
      setState(() => blocks.add(_block));
    }, onError: (a) {
      print(a);
      }, onDone: () {});
  }


  void listenForActivitys() async {
    final Stream<Activity> stream = await getActivitys();
    stream.listen((Activity _activity) {
      setState(() => activitys.add(_activity));
    }, onError: (a) {}, onDone: () {});
  }
  
  void listenForCategorys() async {
    final Stream<Category> stream = await getCategories();
    stream.listen((Category _category) {
      setState(() => categories.add(_category));
    }, onError: (a) {}, onDone: () {});
  }



  Future<void> refreshHome() async {
    blocks = <Block>[];
    activitys = <Activity>[];
    listenForBlocks();
    listenForCategorys();
    //listenForActivitys();
  }


}
