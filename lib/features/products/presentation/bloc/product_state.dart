part of 'product_bloc.dart';

@immutable
class ProductState extends Equatable {
  final List<ProductModel> products;
  final bool isLoading;
  final String? error;

  ProductState({this.products = const [], this.isLoading = false, this.error});

  ProductState copyWidth({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, error];
}
