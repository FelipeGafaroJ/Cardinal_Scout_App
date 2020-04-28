import 'dart:convert';
import 'dart:io';

import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/block.dart';
import 'package:com.cardinalscout/src/models/activity.dart';
//import 'package:com.cardinalscout/src/repository/user_repository.dart' as userRepo;
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;


Future<Stream<Activity>> getActivitys() async {
  
  final String url = '${GlobalConfiguration().getString('api_base_url')}/activities';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  print(streamedRest);


  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) => Activity.fromJSON(data));

}

Future<Stream<Activity>> getActivity(String slug) async {

  final String url = '${GlobalConfiguration().getString('api_base_url')}/activities/$slug';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  //print(Block.fromJSON(data).restaurant.toMap());
    
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .map((data) => Activity.fromJSON(data));

}



Future<Stream<Activity>> getActivitysOfBlock(String blockId) async {
  

  final String url ='http://billing.revoxservices.com/api/blocks/activities/$blockId';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Activity.fromJSON(data);
  });
}

