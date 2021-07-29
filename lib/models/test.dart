import 'dart:convert';
import 'GeneralModels.dart';

Test testFromJson(String? str) => Test.fromJson(json.decode(str!));

String? testToJson(Test data) => json.encode(data.toJson());

class Test {
  Test({
    required this.success,
    required this.data,
    required this.error,
    required this.pagingOutput,
  });

  bool success;
  Data data;
  Error error;
  dynamic pagingOutput;

  factory Test.fromJson(Map<String?, dynamic> json) => Test(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
        pagingOutput: json["pagingOutput"],
      );

  Map<String?, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "error": error.toJson(),
        "pagingOutput": pagingOutput,
      };
}

class Data {
  Data({
    required this.id,
    required this.userName,
    required this.password,
    required this.userType,
    required this.name,
    required this.lastName,
    required this.eMail,
    required this.phone,
    required this.status,
    required this.token,
  });

  int? id;
  String? userName;
  dynamic password;
  int? userType;
  String? name;
  String? lastName;
  String? eMail;
  String? phone;
  int? status;
  dynamic token;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
        userType: json["userType"],
        name: json["name"],
        lastName: json["lastName"],
        eMail: json["eMail"],
        phone: json["phone"],
        status: json["status"],
        token: json["token"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
        "userType": userType,
        "name": name,
        "lastName": lastName,
        "eMail": eMail,
        "phone": phone,
        "status": status,
        "token": token,
      };
}
