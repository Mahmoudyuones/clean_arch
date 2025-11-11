import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/data/models/category_dto.dart';
import 'package:clean_arch/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDatasourceContract {
  Future<BaseResponse<List<ProductDto>>> getProducts({
    bool isSecondary = false,
  });
  Future<BaseResponse<List<CategoryDto>>> getCategories();
}
