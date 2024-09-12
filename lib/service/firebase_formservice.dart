
import 'package:flutter_application_1/api_response/api_response.dart';
import 'package:flutter_application_1/model/form.dart';
abstract class FirebaseFormService {
    Future<ApiResponse> submitValue(User user) ;
   Future<ApiResponse> getValue();
   Future<ApiResponse> deleteStudentById(String id);
}