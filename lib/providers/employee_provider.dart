import 'package:flutter/material.dart';

import '../models/employee.dart';
import '../services/employee_repository.dart';

class EmployeeProvider with ChangeNotifier {
  final _employeeRepository = EmployeeRepository();
  bool isLoading = false;

  List<Employee>? listEmployees;

  Future<bool?> getEmployee() async {
    var data = await _employeeRepository.getEmployee();
    listEmployees = data?.data;
    notifyListeners();
    return true;
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
