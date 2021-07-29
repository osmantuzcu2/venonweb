import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:venonweb/constants.dart';
import 'package:venonweb/models/test.dart';

class TestService {
  String? errorString;
  static Future<Test?> fetchTest() async {
    var bodi = json.encode({"data": 1});
    try {
      String url = baseUrl + '/User/GetById';
      var response = await Dio().post(url,
          data: bodi, options: Options(responseType: ResponseType.json));
      return Test.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
