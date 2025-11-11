import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/data/data_sources/local/home_local_datasource_contract.dart';
import 'package:clean_arch/features/home/data/data_sources/remote/home_reomte_datasource_contract.dart';
import 'package:clean_arch/features/home/data/models/product_dto.dart';
import 'package:clean_arch/features/home/domain/models/category_model.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';
import 'package:clean_arch/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  HomeRepoImpl(this.homeRemoteDatasource, this.homeLocalDatasource);
  HomeRemoteDatasourceContract homeRemoteDatasource;
  HomeLocalDatasourceContract homeLocalDatasource;

  @override
  Future<BaseResponse<List<ProductModel>>> getProducts({
    bool isSecondary = false,
  }) async {
    BaseResponse<List<ProductDto>> productsResponse = await homeRemoteDatasource
        .getProducts(isSecondary: isSecondary);
    switch (productsResponse) {
      case SuccessResponse<List<ProductDto>>():
        List<ProductDto> productsDto = productsResponse.data;
        List<ProductModel> productsModel = productsDto
            .map((e) => e.toDomain())
            .toList();
        return SuccessResponse<List<ProductModel>>(data: productsModel);
      case ErrorResponse():
        return ErrorResponse<List<ProductModel>>(error: productsResponse.error);
    }
  }

  @override
  Future<BaseResponse<List<CategoryModel>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
