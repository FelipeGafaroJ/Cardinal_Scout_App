class Category {

  String id;
  //Media image;
  String name;
  String slug;
  String percentage;
  //bool status;
  
    

  Category();

/*   Category.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        name = jsonMap['name'],
        image = jsonMap['media'][0]['url']; */

 Category.fromJSON(Map<String, dynamic> jsonMap) {

   print(jsonMap);
    id = jsonMap['id'].toString();
    name = jsonMap['name'].toString();
    //image = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media'][0]) : null;
    slug = jsonMap['slug'].toString();
    //status = jsonMap['status'] ?? false;
    //percentage = jsonMap['percentage']; 
   
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      //'image': image,
      'slug': slug,
      //'status': status,
      //'percentage': percentage,
    };
  }
  
  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }
  

}