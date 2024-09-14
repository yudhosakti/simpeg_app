import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simpeg_app/data/host_data.dart';
import 'package:simpeg_app/models/admin_model.dart';

class AdminData {
  Future<AdminModel?> loginUser() async {
    AdminModel? data;

    try {
      var response = await http.post(Uri.parse("${hostData}/admin/login"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        dynamic jsonMap = (jsonData as Map<String, dynamic>)['data'];
        data = AdminModel.getDataFromJSON(jsonData);
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}
