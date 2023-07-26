import 'package:flutter/material.dart';

import '../models/employee.dart';
import '../services/employee_repository.dart';

class EmployeeProvider with ChangeNotifier {
  final _employeeRepository = EmployeeRepository();
  bool isLoading = false;

  List<Employee>? listEmployee;

  Future<bool?> getEmployee() async {
    var data = await _employeeRepository.getEmployee();
    listEmployee = data?.data;
    notifyListeners();
    return true;
  }

  Future<bool?> addEmployee(AddEmployeeRequest employee) =>
      _employeeRepository.addEmployee(employee);
  
  Future<bool?> editEmployee(EditEmployeeRequest employee) =>
      _employeeRepository.editEmployee(employee);

  Future<bool?> deleteEmployee(int employeeId) =>
      _employeeRepository.deleteEmployee(employeeId);

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
