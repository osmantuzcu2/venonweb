import '../../models/GeneralModels.dart';

class UpdateDealer {
  UpdateDealer({
    this.success,
    this.data,
    this.error,
    this.pagingOutput,
  });

  bool? success;
  int? data;
  Error? error;
  dynamic pagingOutput;

  factory UpdateDealer.fromJson(Map<String, dynamic> json) => UpdateDealer(
        success: json["Success"],
        data: json["Data"],
        error: Error.fromJson(json["Error"]),
        pagingOutput: json["PagingOutput"],
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Data": data,
        "Error": error!.toJson(),
        "PagingOutput": pagingOutput,
      };
}
