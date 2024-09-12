import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/api_response/api_response.dart';
import 'package:flutter_application_1/core/api_const.dart';
import 'package:flutter_application_1/core/status_util.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/service/student_service.dart';


class StudentServiceImpl extends StudentService{
 

Api api=Api();
  @override
  Future<ApiResponse> savestudent(Student student)async {
  try{
    await FirebaseFirestore.instance.collection("student").add(student.toJson());
    return ApiResponse(statusUtils: StatusUtils.success);

  }catch(e){
     return ApiResponse(statusUtils: StatusUtils.error,errorMessage: e.toString());

  }
  
  }
  
@override
  Future<ApiResponse> getStudents()async{
    ApiResponse response=await api.get(baseUrl+getstudentsApi);
    return response;
  }
  }
