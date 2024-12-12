import 'package:bloc/bloc.dart';
import 'package:clan_arch_shop/core/datastate/data_state.dart';
import 'package:clan_arch_shop/core/utils/extension.dart';
import 'package:clan_arch_shop/features/products/data/models/product_model.dart';
import 'package:clan_arch_shop/features/products/domain/usecases/get_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase _getProductUseCase;

  ProductBloc(this._getProductUseCase) : super(ProductState()) {
    on<GetProductsEvent>(_onGetProducts);
  }

  void _onGetProducts(GetProductsEvent event, emit) async {
    emit(state.copyWidth(isLoading: true));
    try {
      final dataState = await _getProductUseCase.call();

      if (dataState is DataSuccess) {
        emit(state.copyWidth(products: dataState.data?.fromEntity() ?? [], isLoading: false));
      }
      if (dataState is DataFailed) {
        emit(state.copyWidth(error: dataState.error?.response?.data ?? "", isLoading: false));
      }
    } catch (e) {
      print(e);
      emit(state.copyWidth(error: e.toString(), isLoading: false));
    }
  }
}
