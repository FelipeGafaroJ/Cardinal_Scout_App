import 'package:cardinalscout/src/models/activity.dart';
import 'package:cardinalscout/src/models/block.dart';
import 'package:cardinalscout/src/repository/block_repository.dart';
import 'package:cardinalscout/src/repository/activity_repository.dart';
//import 'package:cardinalscout/src/repository/settings_repository.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {

  List<Block> blocks = <Block>[];
  List<Activity> activitys = <Activity>[];

  HomeController() {
    listenForBlocks();
    //listenForActivitys();
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


  Future<void> refreshHome() async {
    blocks = <Block>[];
    activitys = <Activity>[];
    listenForBlocks();
    //listenForActivitys();
  }


}
