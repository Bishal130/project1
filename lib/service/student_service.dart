
import 'package:flutter_application_1/api_response/api_response.dart';
import 'package:flutter_application_1/model/student.dart';


abstract class StudentService{
  Future<ApiResponse> savestudent(Student student);
  Future<ApiResponse> getStudents();
}
