
class ApiErrorModel {
    int? statusCode;
    String? statusMessage;
    bool? success;

    ApiErrorModel({this.statusCode, this.statusMessage, this.success});

    ApiErrorModel.fromJson(Map<String, dynamic> json) {
        statusCode = json["status_code"];
        statusMessage = json["status_message"];
        success = json["success"];
    }
}