import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class DepartmentRepository {
  Future<EmployeeResponse?> getDepartment() async {
    EmployeeResponse? employeeResponse;
    final sharedPref = await SharedPreferences.getInstance();
    log('token : ${sharedPref.getString('token')}');
    http.Response response = await http.get(
      Uri.parse(Endpoint.employeeList),
      headers: {'token': '${sharedPref.getString('token')}'},
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      employeeResponse = EmployeeResponse.fromJson(jsonString);
    } else {
      throw jsonString['message'];
    }

    return employeeResponse;
  }
}
