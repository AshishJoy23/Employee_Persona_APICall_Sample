import 'dart:developer';

import 'package:employee_persona_api/controller/api_endpoints.dart';
import 'package:employee_persona_api/model/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<UserModel>?> getUsers() async{
    List<UserModel> model;
    try {
      var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.userEndpoint);
      log(url.toString());
      var response = await http.get(url);
      log(response.body);
      if (response.statusCode==200) {
        model = userModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}