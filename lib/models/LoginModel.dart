import 'GeneralModels.dart';

class UserLogin {
  UserLogin({
    this.success,
    this.data,
    this.error,
    this.pagingOutput,
  });

  bool? success;
  Data? data;
  Error? error;
  dynamic pagingOutput;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        success: json["Success"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
        error: Error.fromJson(json["Error"]),
        pagingOutput: json["PagingOutput"],
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Data": data!.toJson(),
        "Error": error!.toJson(),
        "PagingOutput": pagingOutput,
      };
}

class Data {
  Data({
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
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
