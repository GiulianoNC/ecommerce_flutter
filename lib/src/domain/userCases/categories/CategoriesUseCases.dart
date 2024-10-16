import 'package:ecommerce_flutter/src/domain/userCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/GetCategoriesUseCase.dart';

class CategoriesUseCases {

  CreateCategoryUseCase create;
  GetcategoriesUseCase getCategories;

  CategoriesUseCases({
    required this.create,
    required this.getCategories
    });
}