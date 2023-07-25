import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class EmployeeRepository {
  Future<EmployeeResponse?> getEmployee() async {
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

  Future<bool> addEmployee(AddEmployeeRequest employee) async {
    final sharedPref = await SharedPreferences.getInstance();
    http.Response response = await http.post(
      Uri.parse(Endpoint.employeeAdd),
      headers: {'token': '${sharedPref.getString('token')}'},
      body: employee.toJson(),
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw jsonString['message'];
    }
    return true;
  }

  Future<bool> editEmployee(EditEmployeeRequest employee) async {
    final sharedPref = await SharedPreferences.getInstance();
    http.Response response = await http.post(
      Uri.parse(Endpoint.employeeEdit),
      headers: {'token': '${sharedPref.getString('token')}'},
      body: employee.toJson(),
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw jsonString['message'];
    }
    return true;
  }

  Future<bool> deleteEmployee(int employeeId) async {
    final sharedPref = await SharedPreferences.getInstance();
    http.Response response = await http.post(
      Uri.parse(Endpoint.employeeDelete),
      headers: {'token': '${sharedPref.getString('token')}'},
      body: {
        'employee_id' : '$employeeId',
      }
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw jsonString['message'];
    }
    return true;
  }
}
