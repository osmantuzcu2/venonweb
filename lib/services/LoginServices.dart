import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:venonweb/constants.dart';
import 'package:venonweb/models/LoginModel.dart';

class LoginService {
  String? errorString;
  static Future<UserLogin?> sendLogin(String userName, String password) async {
    var bodi = json.encode({"UserName": userName, "Password": password});

    String url = baseUrl + '/User/Login';
    print(userName);
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UserLogin.fromJson(response.data);
  }
}
