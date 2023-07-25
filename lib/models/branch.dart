class BranchResponse {
  bool? success;
  List<Branch>? data;
  String? message;

  BranchResponse({
    this.success,
    this.data,
    this.message,
  });

  BranchResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Branch.fromJson(e)).toList();
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

class Branch {
  String? branchId;
  String? branchName;
  String? branchAddress;
  String? branchPhone;
  int? isStock;
  int? isTransaction;
  int? ledgerId;

  Branch({
    this.branchId,
    this.branchName,
    this.branchAddress,
    this.branchPhone,
    this.isStock,
    this.isTransaction,
    this.ledgerId,
  });

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json["branch_id"];
    branchName = json["branch_name"];
    branchAddress = json["branch_address"];
    branchPhone = json["branch_phone"];
    isStock = json["is_stock"];
    isTransaction = json["is_transaction"];
    ledgerId = json["ledger_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["branch_id"] = branchId;
    _data["branch_name"] = branchName;
    _data["branch_address"] = branchAddress;
    _data["branch_phone"] = branchPhone;
    _data["is_stock"] = isStock;
    _data["is_transaction"] = isTransaction;
    _data["ledger_id"] = ledgerId;
    return _data;
  }
}
