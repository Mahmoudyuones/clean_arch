import 'package:clean_arch/core/values/app_endpoints_strings.dart';
import 'package:clean_arch/features/home/data/models/product_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
@injectable
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(AppEndpointsStrings.getProductsEndpoint)
  Future<ProductsResponse> getproducts();

  @GET(AppEndpointsStrings.getProductsEndpoint2)
  Future<ProductsResponse> getproducts2();
}
