//import 'package:cardinalscout/src/models/media.dart';
import 'package:com.cardinalscout/src/models/activity.dart';

class Category {

  String id;
  //Media image;
  String name;
  String porcentage;
  List<Activity> activitys;

  Category();

  Category.fromJSON(Map<String, dynamic> jsonMap) {
        id = jsonMap['id'].toString();
        name = jsonMap['name'].toString();
        //porcentage = jsonMap['porcentage'].toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      //'porcentage': porcentage,
    };
  }
  
  
  Map<String, dynamic> toMaps() {
    return {
      'id': id,
      'name': name,
      //'status': status,
      //'description': description,
    };
  }
  
  
  @override
  bool operator == (dynamic other) {
    return other.id == this.id;
  }
  

}


