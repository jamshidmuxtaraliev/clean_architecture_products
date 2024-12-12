import 'package:clan_arch_shop/core/datastate/data_state.dart';
import 'package:clan_arch_shop/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
