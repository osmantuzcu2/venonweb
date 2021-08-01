import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:venonweb/constants.dart';

import 'DealersModel.dart';
import 'DealersUpdateModel.dart';

class DealersService {
  String? errorString;
  static Future<Dealers?> fetchDealers() async {
    var bodi =
        json.encode({"EnablePaging": true, "PageNumber": 1, "PageSize": 10});
    try {
      String url = baseUrl + '/Dealer/GetAll';
      var response = await Dio().post(url,
          data: bodi, options: Options(responseType: ResponseType.json));
      return Dealers.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<UpdateDealer?> updateDealer(
      int? id,
      String? title,
      String? email,
      String? phone,
      String? address,
      int? cityId,
      int? CountyId,
      double? latitude,
      double? longitude) async {
    var bodi = json.encode({
      "Id": id,
      "Title": title,
      "EMail": email,
      "Phone": phone,
      "Address": address,
      "CityId": cityId,
      "CountyId": CountyId,
      "Latitude": latitude,
      "Longitude": longitude,
      "Status": 1
    });

    String url = baseUrl + '/Dealer/Update';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateDealer.fromJson(response.data);
  }

  static Future<UpdateDealer?> createDealer(
      String? title,
      String? email,
      String? phone,
      String? address,
      int? cityId,
      int? CountyId,
      double? latitude,
      double? longitude) async {
    var bodi = json.encode({
      "Id": 0,
      "Title": title,
      "EMail": email,
      "Phone": phone,
      "Address": address,
      "CityId": cityId,
      "CountyId": CountyId,
      "Latitude": latitude,
      "Longitude": longitude,
      "Status": 1
    });

    String url = baseUrl + '/Dealer/Add';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateDealer.fromJson(response.data);
  }

  static Future<UpdateDealer?> deleteDealer(
    int id,
  ) async {
    var bodi = json.encode({"Data": id});

    String url = baseUrl + '/Dealer/Remove';
    var response = await Dio().post(url,
        data: bodi, options: Options(responseType: ResponseType.json));
    return UpdateDealer.fromJson(response.data);
  }
}
