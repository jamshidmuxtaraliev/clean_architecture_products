import 'package:clan_arch_shop/core/datastate/data_state.dart';
import 'package:clan_arch_shop/core/network/dio_client.dart';
import 'package:clan_arch_shop/features/products/data/models/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductApiService {
  Future<DataState<List<ProductModel>>> getProducts();
}

class ProductApiServisImpl implements ProductApiService {
  final DioClient _dioClient;

  ProductApiServisImpl(this._dioClient);

  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    try {
      final response = await _dioClient.dio.get("/products");
      final products = List<ProductModel>.from(response.data.map((p) => ProductModel.fromJson(p)));
      return DataSuccess(products);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
        requestOptions: RequestOptions(),
        error: e,
      ));
    }
  }
}
