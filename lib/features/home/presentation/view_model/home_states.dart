import 'package:clean_arch/config/base_state/base_state.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';

class HomeState {
  BaseState<List<ProductModel>>? product1State;

  bool isLoadingProduct2 = true;
  List<ProductModel> productsList2 = [];
  String? errorMessage2;
  HomeState({
    this.product1State,
    this.isLoadingProduct2 = true,
    this.productsList2 = const [],
    this.errorMessage2,
  });
  HomeState copyWith({
    BaseState<List<ProductModel>>? product1State,
    bool? isLoadingProduct2,
    List<ProductModel>? productsList2,
    String? errorMessage2,
  }) {
    return HomeState(
      product1State: product1State ?? this.product1State,
      isLoadingProduct2: isLoadingProduct2 ?? this.isLoadingProduct2,
      productsList2: productsList2 ?? this.productsList2,
      errorMessage2: errorMessage2 ?? this.errorMessage2,
    );
  }
}
// if i needed to add more attributes for product1

// class Product1State extends BaseState<List<ProductModel>> {
//   Product1State({
//     bool? isLoading,
//     List<ProductModel>? data,
//     String? errorMessage,
//   }) : super(isLoading: isLoading, data: data, errorMessage: errorMessage);
// }
