import 'package:flutter/material.dart';

import '../models/department.dart';
import '../services/department_repository.dart';

class DepartmentProvider with ChangeNotifier {
  final _departmentRepository = DepartmentRepository();
  bool isLoading = false;

  List<Department>? listDepartment;

  Future<bool?> getDepartment() async {
    var data = await _departmentRepository.getDepartment();
    listDepartment = data?.data;
    notifyListeners();
    return true;
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
