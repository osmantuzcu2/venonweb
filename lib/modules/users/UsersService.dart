import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:venonweb/constants.dart';
import 'UpdateUserModel.dart';

import 'UsersModel.dart';

class UsersService {
  String? errorString;
  static Future<Users?> fetchUsers() async {
    var bodi =
        json.encode({"EnablePaging": true, "PageNumber": 1, "PageSize": 5});
    try {
      String url = baseUrl + '/User/GetAll';
      var response = await Dio().post(url,
          data: bodi, options: Options(responseType: ResponseType.json));
      return Users.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<UpdateUser?> updateUser(
    int id,
    String userName,
    int userType,
    String name,
    String lastName,
    String eMail,
    String phone,
  ) async {
    var bodi = json.encode({
      "Id": id,
      "UserName": userName,
      "Password": "1234321",
      "UserType": userType,
      "Name": name,
      "LastName": lastName,
      "EMail": eMail,
      "Phone": phone,
      "Status": 1
    });

    String url = baseUrl + '/User/Update';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateUser.fromJson(response.data);
  }

  static Future<UpdateUser?> createUser(
    int userType,
    String name,
    String lastName,
    String passWord,
    String eMail,
    String phone,
  ) async {
    String userName;
    if (userType == 4) {
      userName = phone;
    } else {
      userName = eMail;
    }
    var bodi = json.encode({
      "Id": 0,
      "UserName": userName,
      "Password": passWord,
      "UserType": userType,
      "Name": name,
      "LastName": lastName,
      "EMail": eMail,
      "Phone": phone,
      "Status": 1
    });

    String url = baseUrl + '/User/Add';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateUser.fromJson(response.data);
  }

  static Future<UpdateUser?> deleteUser(
    int id,
  ) async {
    var bodi = json.encode({"Data": id});

    String url = baseUrl + '/User/Remove';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateUser.fromJson(response.data);
  }
}
