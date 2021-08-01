import 'package:venonweb/models/GeneralModels.dart';

class Users {
  Users({
    this.success,
    this.data,
    this.error,
    this.pagingOutput,
  });

  bool? success;
  List<Datum>? data;
  Error? error;
  PagingOutput? pagingOutput;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        success: json["Success"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        error: Error.fromJson(json["Error"]),
        pagingOutput: PagingOutput.fromJson(json["PagingOutput"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "Error": error!.toJson(),
        "PagingOutput": pagingOutput!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.userName,
    this.password,
    this.userType,
    this.name,
    this.lastName,
    this.eMail,
    this.phone,
    this.status,
    this.token,
  });

  int? id;
  String? userName;
  dynamic? password;
  int? userType;
  String? name;
  String? lastName;
  String? eMail;
  String? phone;
  int? status;
  dynamic token;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        userName: json["UserName"],
        password: json["Password"],
        userType: json["UserType"],
        name: json["Name"],
        lastName: json["LastName"],
        eMail: json["EMail"],
        phone: json["Phone"],
        status: json["Status"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserName": userName,
        "Password": password,
        "UserType": userType,
        "Name": name,
        "LastName": lastName,
        "EMail": eMail,
        "Phone": phone,
        "Status": status,
        "Token": token,
      };
}
