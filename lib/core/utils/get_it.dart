import 'package:clan_arch_shop/core/network/dio_client.dart';
import 'package:clan_arch_shop/features/products/data/datasource/remote/product_api_service.dart';
import 'package:clan_arch_shop/features/products/data/repositories/product_repository_impl.dart';
import 'package:clan_arch_shop/features/products/domain/usecases/get_product_usecase.dart';
import 'package:clan_arch_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocators() async {
  //dio
  getIt.registerSingleton<DioClient>(DioClient(Dio()));

  //APi Servis
  getIt.registerSingleton<ProductApiServisImpl>(ProductApiServisImpl(getIt<DioClient>()));

  //Repository
  getIt.registerSingleton<ProductRepositoryImpl>(ProductRepositoryImpl(getIt<ProductApiServisImpl>()));

  //Sse Case
  getIt.registerSingleton<GetProductUseCase>(GetProductUseCase(getIt<ProductRepositoryImpl>()));

  //Bloc
  getIt.registerSingleton<ProductBloc>(ProductBloc(getIt<GetProductUseCase>()));
}
