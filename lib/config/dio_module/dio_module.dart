import 'package:clean_arch/core/values/app_endpoints_strings.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: AppEndpointsStrings.baseUrl));
}
