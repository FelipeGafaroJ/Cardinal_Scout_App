import 'dart:convert';
import 'dart:io';

import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/block.dart';
import 'package:com.cardinalscout/src/models/activity.dart';
//import 'package:com.cardinalscout/src/repository/user_repository.dart' as userRepo;
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;


Future<Stream<Activity>> getActivitys() async {
  
  final String url = 'http://billing.revoxservices.com/api/activities';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    print(Activity.fromJSON(data).toMap());
    return Activity.fromJSON(data);
  });
}

Future<Stream<Activity>> getActivity(String id) async {

  final String url = 'http://billing.revoxservices.com/api/activities/$id';
  
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

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

