import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/data/data_sources/local/home_local_datasource_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDatasourceContract)
class HomeLocalDatasourceImpl implements HomeLocalDatasourceContract {
  @override
  Future<BaseResponse> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
