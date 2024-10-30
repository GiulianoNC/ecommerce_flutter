import 'package:ecommerce_flutter/src/domain/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/products/UpdateProductUseCase.dart';

class ProductsUsesCases{
  
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductUseCase update;

  ProductsUsesCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update
  });
}