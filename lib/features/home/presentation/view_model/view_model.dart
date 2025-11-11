import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/config/base_state/base_state.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';
import 'package:clean_arch/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:clean_arch/features/home/presentation/view_model/home_events.dart';
import 'package:clean_arch/features/home/presentation/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel(this._getProductsUsecase) : super(HomeState());

  final GetProductsUsecase _getProductsUsecase;

  void doIntent(HomeEvents event) {
    switch (event) {
      case GetAllDataEvent():
        _getAllData();
      case GetProduct1Event():
        _getProducts1();
      case GetProduct2Event():
        _getProducts2();
    }
  }

  void _getAllData() async {
    _getProducts1();
    _getProducts2();
  }

  void _getProducts1() async {
    emit(
      state.copyWith(
        product1State: BaseState<List<ProductModel>>(isLoading: true),
      ),
    );
    BaseResponse<List<ProductModel>> res = await _getProductsUsecase();
    switch (res) {
      case SuccessResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            product1State: BaseState<List<ProductModel>>(
              data: res.data,
              isLoading: false,
            ),
          ),
        );
      case ErrorResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            product1State: BaseState<List<ProductModel>>(
              isLoading: false,
              errorMessage: res.error.toString(),
            ),
          ),
        );
    }
  }

  void _getProducts2() async {
    emit(state.copyWith(isLoadingProduct2: true));
    await Future.delayed(const Duration(seconds: 2));

    BaseResponse<List<ProductModel>> res = await _getProductsUsecase(
      isSecondary: true,
    );
    switch (res) {
      case SuccessResponse<List<ProductModel>>():
        emit(state.copyWith(isLoadingProduct2: false, productsList2: res.data));
      case ErrorResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            isLoadingProduct2: false,
            errorMessage2: res.error.toString(),
          ),
        );
    }
  }

  void getCategories() async {
    // List<CategoryModel> categories = await getCategoriesUsecase.call();
  }
}
