import 'dart:convert';

import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/category.dart';
import 'package:com.cardinalscout/src/models/user.dart';
import 'package:com.cardinalscout/src/repository/user_repository.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

Future<Stream<Category>> getCategories() async {
  final String url = 'http://billing.revoxservices.com/api/categories';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) => Category.fromJSON(data));
}

Future<Stream<Category>> getCategory(String id) async {

  print(id);
  final String url = 'http://billing.revoxservices.com/api/categories/$id';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .map((data) {
      print(Category.fromJSON(data).toMaps());
    return Category.fromJSON(data);
  });

}



Future<Stream<Category>> getCategoriesUser() async {

  User _user = await getCurrentUser();
  final String _apiToken = '${_user.apiToken}';
  final String url = 'http://billing.revoxservices.com/api/categories/filters/${_apiToken}';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) {
      return Category.fromJSON(data);
    });


}
