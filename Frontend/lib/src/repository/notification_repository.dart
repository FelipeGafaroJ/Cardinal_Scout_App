import 'dart:convert';
import 'dart:io';

import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/notification.dart';
import 'package:com.cardinalscout/src/models/user.dart';
import 'package:com.cardinalscout/src/repository/user_repository.dart' as userRepo;
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

Future<Stream<Notification>> getNotifications() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}notifications?${_apiToken}search=notifiable_id:${_user.id}&searchFields=notifiable_id:=&orderBy=created_at&sortedBy=desc&limit=10';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Notification.fromJSON(data);
  });
}
