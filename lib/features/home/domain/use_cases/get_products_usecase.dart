import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';
import 'package:clean_arch/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUsecase {
  HomeRepoContract homeRepo;
  GetProductsUsecase(this.homeRepo);

  Future<BaseResponse<List<ProductModel>>> call({bool isSecondary = false}) =>
      homeRepo.getProducts(isSecondary: isSecondary);
}
