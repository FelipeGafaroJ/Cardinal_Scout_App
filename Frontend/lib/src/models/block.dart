//import 'package:com.cardinalscout/src/models/media.dart';
import 'package:com.cardinalscout/src/models/activity.dart';

class Block {

  String id;
  //Media image;
  String name;
  String slug;
  //bool status;
  String description;
  List<Activity> activitys;

  Block();

  Block.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    name = jsonMap['name'].toString();
    slug = jsonMap['slug'].toString();
    description = jsonMap['description']; 
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      //'image': image,
      'slug': slug,
      //'status': status,
      'description': description,
    };
  }

  
  
  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }
  

}
