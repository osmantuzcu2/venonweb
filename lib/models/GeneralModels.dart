class Error {
  Error({
    this.code,
    this.message,
    this.messageDetail,
  });

  int? code;
  dynamic message;
  dynamic messageDetail;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["Code"],
        message: json["Message"],
        messageDetail: json["MessageDetail"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "MessageDetail": messageDetail,
      };
}

class PagingOutput {
  PagingOutput({
    this.pageIndex,
    this.pageCount,
    this.recordCount,
  });

  int? pageIndex;
  int? pageCount;
  int? recordCount;

  factory PagingOutput.fromJson(Map<String, dynamic> json) => PagingOutput(
        pageIndex: json["PageIndex"],
        pageCount: json["PageCount"],
        recordCount: json["RecordCount"],
      );

  Map<String, dynamic> toJson() => {
        "PageIndex": pageIndex,
        "PageCount": pageCount,
        "RecordCount": recordCount,
      };
}

class UserTypeModel {
  UserTypeModel({
    this.code,
    this.type,
  });

  int? code;
  String? type;
}
