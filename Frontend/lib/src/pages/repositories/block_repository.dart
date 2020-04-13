import 'dart:convert';
import 'package:cardinal_scout_app/src/helpers/helper.dart';
import 'package:cardinal_scout_app/src/pages/models/block_model.dart';
import 'package:cardinal_scout_app/src/pages/models/activity_model.dart';

import 'package:http/http.dart' as http;

/* 
import 'package:revoxfood/src/helpers/helper.dart';
import 'package:revoxfood/src/models/category.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
 */

Future<Stream<Activity>> getCategories() async {
  final String url = 'http://127.0.0.1:8000/activities';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) => Activity.fromJSON(data));
}

Future<Stream<Activity>> getActivity(String id) async {
  final String url = 'http://127.0.0.1:8000/activities$id';
  //final String url = '${GlobalConfiguration().getString('api_base_url')}categories/$id';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .map((data) => Activity.fromJSON(data));
}
