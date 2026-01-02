import 'package:clean_arch/config/base_response/base_response.dart';
import 'package:clean_arch/features/home/api/data_sources/local/home_local_datasource_impl.dart';
import 'package:clean_arch/features/home/api/data_sources/remote/home_remote_datasource_impl.dart';
import 'package:clean_arch/features/home/data/models/product_dto.dart';
import 'package:clean_arch/features/home/data/repo/home_repo_impl.dart';
import 'package:clean_arch/features/home/domain/models/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDatasourceImpl, HomeLocalDatasourceImpl])
void main() {
  late HomeRepoImpl homeRepoImpl;
  late MockHomeRemoteDatasourceImpl mockHomeRemoteDatasourceImpl;
  late MockHomeLocalDatasourceImpl mockHomeLocalDatasourceImpl;
  setUpAll(() {
    provideDummy<BaseResponse<List<ProductDto>>>(
      SuccessResponse<List<ProductDto>>(data: []),
    );
    mockHomeRemoteDatasourceImpl = MockHomeRemoteDatasourceImpl();
    mockHomeLocalDatasourceImpl = MockHomeLocalDatasourceImpl();

    homeRepoImpl = HomeRepoImpl(
      mockHomeRemoteDatasourceImpl,
      mockHomeLocalDatasourceImpl,
    );
  });

  group('get products function test cases', () {
    test('test success state with productdto non empty list', () async {
      // Arrange
      List<ProductDto> dumyProductsDtoList = [
        ProductDto(id: '1', title: 'title1', imageCover: 'image1', price: 10),
        ProductDto(id: '2', title: 'title2', imageCover: 'image2', price: 20),
      ];
      // result ====> SuccessResponse<List<ProductDto>>(data: dumyProductsDtoList);

      when(mockHomeRemoteDatasourceImpl.getProducts()).thenAnswer(
        (_) async =>
            SuccessResponse<List<ProductDto>>(data: dumyProductsDtoList),
      );

      // Act
      final result = await homeRepoImpl.getProducts();
      // Assert

      expect(result, isA<SuccessResponse<List<ProductModel>>>());
      expect(
        (result as SuccessResponse<List<ProductModel>>).data.length,
        dumyProductsDtoList.length,
      );
      expect(result.data[0].id, dumyProductsDtoList[0].id);
      expect(result.data[0].name, dumyProductsDtoList[0].title);
      expect(result.data[0].image, dumyProductsDtoList[0].imageCover);
      expect(result.data[1].id, dumyProductsDtoList[1].id);
      expect(result.data[1].name, dumyProductsDtoList[1].title);
      expect(result.data[1].image, dumyProductsDtoList[1].imageCover);

      verify(mockHomeRemoteDatasourceImpl.getProducts()).called(1);
    });
    test('test success state with productdto empty list ', () async {
      // Arrange
      when(
        mockHomeRemoteDatasourceImpl.getProducts(),
      ).thenAnswer((_) async => SuccessResponse<List<ProductDto>>(data: []));

      // Act
      final result = await homeRepoImpl.getProducts();

      // Assert
      expect(result, isA<SuccessResponse<List<ProductModel>>>());
      expect(result, isA<SuccessResponse<List<ProductModel>>>());
      expect(
        (result as SuccessResponse<List<ProductModel>>).data.length,
        isZero,
      );

      verify(mockHomeRemoteDatasourceImpl.getProducts()).called(1);
    });

    test('test error state with productdto non empty list', () async {
      // Arrange
      Exception dummyException = Exception('Error occurred');

      when(mockHomeRemoteDatasourceImpl.getProducts()).thenAnswer(
        (_) async => ErrorResponse<List<ProductDto>>(error: dummyException),
      );

      // Act
      final result = await homeRepoImpl.getProducts();

      // Assert
      expect(result, isA<ErrorResponse<List<ProductModel>>>());
      expect(
        (result as ErrorResponse<List<ProductModel>>).error.toString(),
        dummyException.toString(),
      );

      verify(mockHomeRemoteDatasourceImpl.getProducts()).called(1);
    });
  });
}
