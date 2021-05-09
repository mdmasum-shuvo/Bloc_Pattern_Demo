import 'package:bloc_pattern_flutter/data_model.dart';
import 'package:bloc_pattern_flutter/network_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  Future<List<User>> getAllUser() async {
    final response = await http.Client().get(BASE_URL + USER_END_POINT,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': TOKEN
        });
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result;
      return list.map((e) => User.fromJson(e)).toList();
    } else
      throw Exception();
  }
}
