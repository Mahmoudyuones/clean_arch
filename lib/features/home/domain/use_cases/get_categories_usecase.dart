import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  HomeRepoContract homeRepo;
  GetCategoriesUsecase(this.homeRepo);

  Future<BaseResponse> call() => homeRepo.getCategories();
}
