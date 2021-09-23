import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../login_page.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
class UsersApi{

  static List<User> parseUsers(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<User> users = list.map((model) => User.fromJson(model)).toList();
    return users;
  }

  static Future<List<User>> getUsers() async {
    final response = await http.get("http://test11.internative.net/User/GetUsers",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'aplication/json',
          'Authorization':'Bearer $token',
        });
    if (response.statusCode == 200) {
      print("status deger: ${response.statusCode}");
      return compute(parseUsers, response.body);
    } else {
      throw Exception("Bağlanamadı : ${response.statusCode}");
    }
  }

}