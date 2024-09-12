import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/api_response/api_response.dart';
import 'package:flutter_application_1/core/api_const.dart';
import 'package:flutter_application_1/service/product_service.dart';


class ProductServiceImpl extends ProductService {
  Api api = Api();

  @override
  Future<ApiResponse> getProducts() async {
    ApiResponse response = await api.get(baseUrl + getproductApi);
    return response;
  }
}
