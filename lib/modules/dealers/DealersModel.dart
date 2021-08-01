import 'package:venonweb/models/GeneralModels.dart';

class Dealers {
  Dealers({
    this.success,
    this.data,
    this.error,
    this.pagingOutput,
  });

  bool? success;
  List<Datum>? data;
  Error? error;
  PagingOutput? pagingOutput;

  factory Dealers.fromJson(Map<String, dynamic> json) => Dealers(
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
    this.title,
    this.eMail,
    this.phone,
    this.address,
    this.cityId,
    this.countyId,
    this.latitude,
    this.longitude,
    this.status,
  });

  int? id;
  String? title;
  String? eMail;
  String? phone;
  String? address;
  int? cityId;
  int? countyId;
  double? latitude;
  double? longitude;
  int? status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        title: json["Title"],
        eMail: json["EMail"],
        phone: json["Phone"],
        address: json["Address"],
        cityId: json["CityId"],
        countyId: json["CountyId"],
        latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
        longitude:
            json["Longitude"] == null ? null : json["Longitude"].toDouble(),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "EMail": eMail,
        "Phone": phone,
        "Address": address,
        "CityId": cityId,
        "CountyId": countyId,
        "Latitude": latitude == null ? null : latitude,
        "Longitude": longitude == null ? null : longitude,
        "Status": status,
      };
}
