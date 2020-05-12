import 'package:com.cardinalscout/src/models/media.dart';

class Activity {

  String id;
  Media image;
  String name;
  String slug;
  //bool status;
  //bool pritority;
  String type;
  String description;
  int block;
  int category;

  Activity();

  Activity.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    name = jsonMap['name'].toString();
    //image = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media'][0]) : null;
    slug = jsonMap['slug'].toString();
    //status = jsonMap['status'];
    //pritority = jsonMap['pritority'];
    //type = jsonMap['type'];
    description = jsonMap['description'];
    //block = jsonMap['block_id'];
    //category = jsonMap['category_id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      //'image': image,
      'slug': slug,
      //'status': status,
      //'pritority': pritority,
      //'type': type,
      'description': description,
      //'block': block,
      //'category': category,
    };
  }

}
