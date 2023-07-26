import 'package:flutter/material.dart';

import '../models/branch.dart';
import '../services/branch_repository.dart';

class BranchProvider with ChangeNotifier {
  final _branchRepository = BranchRepository();
  bool isLoading = false;

  List<Branch>? listBranch;

  Future<bool?> getBranch() async {
    var data = await _branchRepository.getBranch();
    listBranch = data?.data;
    notifyListeners();
    return true;
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
