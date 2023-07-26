class EmployeeResponse {
  bool? success;
  List<Employee>? data;
  String? message;

  EmployeeResponse({this.success, this.data, this.message});

  EmployeeResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Employee.fromJson(e)).toList();
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["message"] = message;
    return _data;
  }
}

class Employee {
  int? employeeId;
  String? employeeName;
  String? employeeAddress;
  String? employeeDob;
  String? employeeMail;
  int? departmentId;
  int? flagEmployee;
  String? branchId;
  String? branchName;
  String? departmentName;

  Employee({
    this.employeeId,
    this.employeeName,
    this.employeeAddress,
    this.employeeDob,
    this.employeeMail,
    this.departmentId,
    this.flagEmployee,
    this.branchId,
    this.branchName,
    this.departmentName,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    employeeId = json["employee_id"];
    employeeName = json["employee_name"];
    employeeAddress = json["employee_address"];
    employeeDob = json["employee_dob"];
    employeeMail = json["employee_mail"];
    departmentId = json["department_id"];
    flagEmployee = json["flag_employee"];
    branchId = json["branch_id"];
    branchName = json["branch_name"];
    departmentName = json["department_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["employee_id"] = employeeId;
    _data["employee_name"] = employeeName;
    _data["employee_address"] = employeeAddress;
    _data["employee_dob"] = employeeDob;
    _data["employee_mail"] = employeeMail;
    _data["department_id"] = departmentId;
    _data["flag_employee"] = flagEmployee;
    _data["branch_id"] = branchId;
    _data["branch_name"] = branchName;
    _data["department_name"] = departmentName;
    return _data;
  }
}

class AddEmployeeRequest {
  String? employeeName;
  String? employeeAddress;
  String? employeeMail;
  String? employeeDob;
  String? departmentId;
  String? branchId;

  AddEmployeeRequest({
    this.employeeName,
    this.employeeAddress,
    this.employeeMail,
    this.employeeDob,
    this.departmentId,
    this.branchId,
  });

  AddEmployeeRequest.fromJson(Map<String, dynamic> json) {
    employeeName = json["employee_name"];
    employeeAddress = json["employee_address"];
    employeeMail = json["employee_mail"];
    employeeDob = json["employee_dob"];
    departmentId = json["department_id"];
    branchId = json["branch_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["employee_name"] = employeeName;
    _data["employee_address"] = employeeAddress;
    _data["employee_mail"] = employeeMail;
    _data["employee_dob"] = employeeDob;
    _data["department_id"] = departmentId;
    _data["branch_id"] = branchId;
    return _data;
  }
}

class EditEmployeeRequest {
  String? employeeId;
  String? employeeName;
  String? employeeAddress;
  String? employeeMail;
  String? employeeDob;
  String? departmentId;
  String? branchId;

  EditEmployeeRequest({
    this.employeeId,
    this.employeeName,
    this.employeeAddress,
    this.employeeMail,
    this.employeeDob,
    this.departmentId,
    this.branchId,
  });

  EditEmployeeRequest.fromJson(Map<String, dynamic> json) {
    employeeId = json["employee_id"];
    employeeName = json["employee_name"];
    employeeAddress = json["employee_address"];
    employeeMail = json["employee_mail"];
    employeeDob = json["employee_dob"];
    departmentId = json["department_id"];
    branchId = json["branch_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["employee_id"] = employeeId;
    _data["employee_name"] = employeeName;
    _data["employee_address"] = employeeAddress;
    _data["employee_mail"] = employeeMail;
    _data["employee_dob"] = employeeDob;
    _data["department_id"] = departmentId;
    _data["branch_id"] = branchId;
    return _data;
  }
}
