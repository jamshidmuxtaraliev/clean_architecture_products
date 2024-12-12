import 'package:clan_arch_shop/core/datastate/data_state.dart';
import 'package:clan_arch_shop/core/usecase/usecase.dart';
import 'package:clan_arch_shop/features/products/data/repositories/product_repository_impl.dart';
import 'package:clan_arch_shop/features/products/domain/entities/product_entity.dart';

class GetProductUseCase extends UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepositoryImpl _productRepositoryImpl;

  GetProductUseCase(this._productRepositoryImpl);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {
    return await _productRepositoryImpl.getProducts();
  }
}
