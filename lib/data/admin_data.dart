import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simpeg_app/data/host_data.dart';
import 'package:simpeg_app/models/admin_model.dart';

class AdminData {
  Future<AdminModel?> loginUser(String email, String password) async {
    AdminModel? data;

    try {
      var response = await http.post(Uri.parse("${hostData}/admin/login"),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({"email": email, "password": password}));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        dynamic jsonMap = (jsonData as Map<String, dynamic>)['data'];
        data = AdminModel.getDataFromJSON(jsonMap);
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }

  Future<bool> registerUser(
      String email, String username, String password) async {
    try {
      var response = await http.post(Uri.parse("${hostData}/admin/register"),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode(
              {"email": email, "username": username, "password": password}));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
