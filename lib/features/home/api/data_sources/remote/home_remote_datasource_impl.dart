import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/api/api_client/api_client.dart';
import 'package:clean_arch/features/home/data/data_sources/remote/home_reomte_datasource_contract.dart';
import 'package:clean_arch/features/home/data/models/category_dto.dart';
import 'package:clean_arch/features/home/data/models/product_dto.dart';
import 'package:clean_arch/features/home/data/models/product_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDatasourceContract)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasourceContract {
  HomeRemoteDatasourceImpl(this.apiClient);
  final HomeApiClient apiClient;
  @override
  Future<BaseResponse<List<ProductDto>>> getProducts({
    bool isSecondary = false,
  }) async {
    try {
      final ProductsResponse productsResponse = isSecondary
          ? await apiClient.getproducts()
          : await apiClient.getproducts();
      final List<ProductDto> products = productsResponse.data ?? [];
      return SuccessResponse<List<ProductDto>>(data: products);
    } catch (e) {
      return ErrorResponse<List<ProductDto>>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<List<CategoryDto>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
