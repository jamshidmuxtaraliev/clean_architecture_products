import 'package:clan_arch_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:clan_arch_shop/features/products/presentation/widgets/prod_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahsulotlar"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Column(
              children: [
                TextButton(
                    child: Text("Qayta urinish"),
                    onPressed: () {
                      context.read<ProductBloc>().add(GetProductsEvent());
                    }),
              ],
            );
          }

          final products = state.products;

          if (products.isEmpty) {
            return Center(child: Text("Mahsulotlar bosh"));
          }

          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                return ProdItemView(item: products[index]);
              });
        },
      ),
    );
  }
}
