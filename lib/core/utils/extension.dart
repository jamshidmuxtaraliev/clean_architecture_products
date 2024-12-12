import 'package:clan_arch_shop/features/products/data/models/category_model.dart';
import 'package:clan_arch_shop/features/products/data/models/product_model.dart';
import 'package:clan_arch_shop/features/products/domain/entities/category_entity.dart';
import 'package:clan_arch_shop/features/products/domain/entities/product_entity.dart';

extension JMList on List<ProductEntity> {
  List<ProductModel> fromEntity() {
    final products = <ProductModel>[];

    for (var prodEntity in this) {
      products.add(ProductModel(
          id: prodEntity.id,
          title: prodEntity.title,
          price: prodEntity.price,
          description: prodEntity.description,
          category: prodEntity.category.fromEntity(),
          images: prodEntity.images));
    }

    return products;
  }
}

extension JMCategory on CategoryEntity {
  CategoryModel fromEntity() {
    return CategoryModel(id: id, name: name, image: image);
  }
}
