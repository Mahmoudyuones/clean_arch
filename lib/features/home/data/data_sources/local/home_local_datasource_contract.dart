import 'package:clean_arch/config/base_response/base_response.dart';

abstract class HomeLocalDatasourceContract {
  Future<BaseResponse> getCategories();
  Future<BaseResponse> getProducts();
}
