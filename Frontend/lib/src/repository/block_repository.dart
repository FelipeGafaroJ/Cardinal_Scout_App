import 'dart:convert';
import 'dart:io';

import 'package:cardinalscout/src/helpers/helper.dart';
import 'package:cardinalscout/src/models/block.dart';
import 'package:cardinalscout/src/models/activity.dart';
//import 'package:cardinalscout/src/repository/user_repository.dart' as userRepo;
//import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;


Future<Stream<Block>> getBlocks() async {
  
  
  final String url = 'http://billing.revoxservices.com/api/blocks';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) {
      //print(Block.fromJSON(data).toMap());
      return Block.fromJSON(data);
    });

}

Future<Stream<Block>> getBlock(String id) async {

  //final String url = 'http://billing.revoxservices.com/api/blocks/$id';  
  final String url ='http://billing.revoxservices.com/api/blocks/$id?with=activities';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  //print(Block.fromJSON(data).restaurant.toMap());
    
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .map((data) {
    print(Block.fromJSON(data).toMap());
    return Block.fromJSON(data);
  });


}
