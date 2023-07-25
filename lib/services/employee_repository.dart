import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class EmployeeRepository {
  Future<EmployeeResponse?> getEmployee() async {
    EmployeeResponse? employeeResponse;
    final sharedPref = await SharedPreferences.getInstance();
    http.Response response = await http.post(
      Uri.parse(Endpoint.employeeList),
      headers: {'Authorization': 'Bearer ${sharedPref.getString('token')}'},
    );

    var jsonString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      employeeResponse = EmployeeResponse.fromJson(jsonString);
    } else {
      throw jsonString['message'];
    }

    return employeeResponse;
  }
}
