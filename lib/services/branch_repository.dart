import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/branch.dart';
import 'package:http/http.dart' as http;

import '../res/endpoint.dart';

class BranchRepository {
  Future<BranchResponse?> getBranch() async {
    BranchResponse? branchResponse;
    final sharedPref = await SharedPreferences.getInstance();
    log('token : ${sharedPref.getString('token')}');
    http.Response response = await http.get(
      Uri.parse(Endpoint.branchList),
      headers: {'token': '${sharedPref.getString('token')}'},
    );

    log(response.body);

    var jsonString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      branchResponse = BranchResponse.fromJson(jsonString);
    } else {
      throw jsonString['message'];
    }

    return branchResponse;
  }
}
