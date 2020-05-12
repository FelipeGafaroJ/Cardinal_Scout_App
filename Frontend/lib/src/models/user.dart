import 'package:com.cardinalscout/src/models/media.dart';

class User {
  String id;
  String username;
  String firstname;
  String lastname;
  String email;
  String password;
  String apiToken;
  String deviceToken;
  String phone;
  String address;
  String bio;

  // used for indicate if client logged in or not
  bool auth;

//  String role;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    username = jsonMap['username'];
    firstname = jsonMap['firstname'];
    lastname = jsonMap['lastname'];
    email = jsonMap['email'];
    apiToken = jsonMap['api_token'];
    deviceToken = jsonMap['device_token'];

    try {
      phone = jsonMap['custom_fields']['phone']['view'];
    } catch (e) {
      phone = "";
    }

    try {
      address = jsonMap['custom_fields']['address']['view'];
    } catch (e) {
      address = "";
    }

  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["username"] = username;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["password"] = password;
    map["api_token"] = apiToken;
    map["device_token"] = deviceToken;
    map["phone"] = phone;
    map["address"] = address;
    return map;
  }

  @override
  String toString() {
    var map = this.toMap();
    map["auth"] = this.auth;
    return map.toString();
  }
}
