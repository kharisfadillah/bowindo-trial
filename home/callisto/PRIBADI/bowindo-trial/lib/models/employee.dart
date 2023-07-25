
class Employee {
  bool? success;
  List<Data>? data;
  String? message;

  Employee({this.success, this.data, this.message});

  Employee.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["message"] = message;
    return _data;
  }
}

class Data {
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

  Data({this.employeeId, this.employeeName, this.employeeAddress, this.employeeDob, this.employeeMail, this.departmentId, this.flagEmployee, this.branchId, this.branchName, this.departmentName});

  Data.fromJson(Map<String, dynamic> json) {
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