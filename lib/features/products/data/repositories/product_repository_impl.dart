import 'package:clan_arch_shop/core/datastate/data_state.dart';
import 'package:clan_arch_shop/features/products/data/datasource/remote/product_api_service.dart';
import 'package:clan_arch_shop/features/products/domain/entities/product_entity.dart';
import 'package:clan_arch_shop/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(this._productApiService);

  @override
  Future<DataState<List<ProductEntity>>> getProducts() {
    return _productApiService.getProducts();
  }
}
