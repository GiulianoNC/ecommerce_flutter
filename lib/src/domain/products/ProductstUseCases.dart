import 'package:ecommerce_flutter/src/domain/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/products/GetProductsByCategoryUseCase.dart';

class ProductsUsesCases{
  
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;

  ProductsUsesCases({
    required this.create,
    required this.getProductsByCategory
  });
}