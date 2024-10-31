import 'package:ecommerce_flutter/src/domain/userCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/DeleteProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/UpdateProductUseCase.dart';

class ProductsUsesCases{
  
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductUseCase update;
  DeleteProductUseCase delete;

  ProductsUsesCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
    required this.delete
  });
}