import 'package:flutter_application_1/core/status_util.dart';


class ApiResponse {
  StatusUtils? statusUtils;
  String? errorMessage;
  dynamic data;

ApiResponse({this.data,this.errorMessage,this.statusUtils});
}
