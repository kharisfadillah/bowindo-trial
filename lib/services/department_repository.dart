import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/department.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class DepartmentRepository {
  Future<DepartmentResponse?> getDepartment() async {
    DepartmentResponse? departmentResponse;
    final sharedPref = await SharedPreferences.getInstance();
    log('token : ${sharedPref.getString('token')}');
    http.Response response = await http.get(
      Uri.parse(Endpoint.departmentList),
      headers: {'token': '${sharedPref.getString('token')}'},
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      departmentResponse = DepartmentResponse.fromJson(jsonString);
    } else {
      throw jsonString['message'];
    }

    return departmentResponse;
  }
}
