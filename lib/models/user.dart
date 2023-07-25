class UserResponse {
  bool? success;
  String? message;
  User? user;
  String? token;
  String? refresh;

  UserResponse({
    this.success,
    this.message,
    this.user,
    this.token,
    this.refresh,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    user = json["data"] == null ? null : User.fromJson(json["data"]);
    token = json["token"];
    refresh = json["refresh"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["message"] = message;
    if (user != null) {
      data["data"] = user?.toJson();
    }
    data["token"] = token;
    data["refresh"] = refresh;
    return data;
  }
}

class User {
  String? userId;
  String? userName;
  int? levelId;
  String? userMail;
  String? branchId;
  String? levelName;
  String? userMenu;
  int? storeId;
  String? storeName;
  String? storeAddress;
  String? storePhone;
  int? flagStore;
  int? storeTaxId;
  String? pkpDate;
  int? isPkp;
  String? ledgerDate;
  int? allowMinusTransaction;
  String? lastAllowedDate;
  int? printSizeDefault;
  String? taxRatio;
  String? validUntil;

  User({
    this.userId,
    this.userName,
    this.levelId,
    this.userMail,
    this.branchId,
    this.levelName,
    this.userMenu,
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storePhone,
    this.flagStore,
    this.storeTaxId,
    this.pkpDate,
    this.isPkp,
    this.ledgerDate,
    this.allowMinusTransaction,
    this.lastAllowedDate,
    this.printSizeDefault,
    this.taxRatio,
    this.validUntil,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    userName = json["user_name"];
    levelId = json["level_id"];
    userMail = json["user_mail"];
    branchId = json["branch_id"];
    levelName = json["level_name"];
    userMenu = json["user_menu"];
    storeId = json["store_id"];
    storeName = json["store_name"];
    storeAddress = json["store_address"];
    storePhone = json["store_phone"];
    flagStore = json["flag_store"];
    storeTaxId = json["store_tax_id"];
    pkpDate = json["pkp_date"];
    isPkp = json["is_pkp"];
    ledgerDate = json["ledger_date"];
    allowMinusTransaction = json["allow_minus_transaction"];
    lastAllowedDate = json["last_allowed_date"];
    printSizeDefault = json["print_size_default"];
    taxRatio = json["tax_ratio"];
    validUntil = json["valid_until"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = userId;
    data["user_name"] = userName;
    data["level_id"] = levelId;
    data["user_mail"] = userMail;
    data["branch_id"] = branchId;
    data["level_name"] = levelName;
    data["user_menu"] = userMenu;
    data["store_id"] = storeId;
    data["store_name"] = storeName;
    data["store_address"] = storeAddress;
    data["store_phone"] = storePhone;
    data["flag_store"] = flagStore;
    data["store_tax_id"] = storeTaxId;
    data["pkp_date"] = pkpDate;
    data["is_pkp"] = isPkp;
    data["ledger_date"] = ledgerDate;
    data["allow_minus_transaction"] = allowMinusTransaction;
    data["last_allowed_date"] = lastAllowedDate;
    data["print_size_default"] = printSizeDefault;
    data["tax_ratio"] = taxRatio;
    data["valid_until"] = validUntil;
    return data;
  }
}
