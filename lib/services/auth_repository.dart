import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class AuthRepository {
  Future<UserResponse?> login(
    String userId,
    String password,
  ) async {
    UserResponse? userResponse;
    http.Response response = await http.post(
      Uri.parse(Endpoint.login),
      body: {
        "user_id": userId,
        "user_password": password,
      },
    );

    var jsonString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      userResponse = UserResponse.fromJson(jsonString);
    } else {
      throw jsonString['message'];
    }

    return userResponse;
  }
}
