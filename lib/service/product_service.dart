import 'package:flutter_application_1/api_response/api_response.dart';

abstract class ProductService {
  Future<ApiResponse> getProducts();
}