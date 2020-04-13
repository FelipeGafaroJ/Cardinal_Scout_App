class Activity {
  String id;
  String imageUrl;
  String name;
  String slug;
  bool status;
  bool pritority;
  String type;
  String description;
  int block_id;
  int category_id;


  //List<String> startTimes;
  //int rating;
  //int price;

  Activity();

    Activity.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        name = jsonMap['name'],
        //image = jsonMap['media'][0]['url'];
        slug = jsonMap['slug'],
        status = jsonMap['slug'],
        pritority = jsonMap['slug'],
        type = jsonMap['slug'],
        description = jsonMap['slug'],
        block_id = jsonMap['slug'],
        category_id = jsonMap['slug'];
}

/*   Activity({
    this.imageUrl,
    this.name,
    this.slug,
    this.status,
    this.pritority,
    this.type,
    this.description,
    this.block_id,
    this.category_id,


   // this.startTimes,
    //this.rating,
    //this.price,
  

    }
  ); 
  }*/








/* class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
    this.rating,
    this.price,
  });
} */
