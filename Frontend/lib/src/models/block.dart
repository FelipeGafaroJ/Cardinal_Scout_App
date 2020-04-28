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
    //image = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media'][0]) : null;
    slug = jsonMap['slug'].toString();
    //status = jsonMap['status'] ?? false;
    description = jsonMap['description']; 
    activitys = jsonMap['activitys'] != null
        ? List.from(jsonMap['activitys']).map((element) => Activity.fromJSON(element)).toList()
        : null;
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
