import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/domain/models/category_model.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<CategoryModel>>> getCategories();
  Future<BaseResponse<List<ProductModel>>> getProducts({
    bool isSecondary = false,
  });
}
