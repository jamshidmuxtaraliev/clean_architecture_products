import 'package:clan_arch_shop/core/utils/get_it.dart';
import 'package:clan_arch_shop/features/products/domain/usecases/get_product_usecase.dart';
import 'package:clan_arch_shop/features/products/presentation/pages/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/products/presentation/bloc/product_bloc.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(getIt<GetProductUseCase>())..add(GetProductsEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
