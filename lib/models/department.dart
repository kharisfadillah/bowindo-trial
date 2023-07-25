class DepartmentResponse {
    bool? success;
    List<Department>? data;
    String? message;

    DepartmentResponse({this.success, this.data, this.message});

    DepartmentResponse.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Department.fromJson(e)).toList();
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

class Department {
    int? departmentId;
    String? departmentName;

    Department({this.departmentId, this.departmentName});

    Department.fromJson(Map<String, dynamic> json) {
        departmentId = json["department_id"];
        departmentName = json["department_name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["department_id"] = departmentId;
        _data["department_name"] = departmentName;
        return _data;
    }
}