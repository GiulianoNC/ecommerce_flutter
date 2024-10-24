import 'package:ecommerce_flutter/src/domain/userCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/UpdateCategoryUseCase.dart';

class CategoriesUseCases {

  CreateCategoryUseCase create;
  GetcategoriesUseCase getCategories;
  UpdateCategoryUseCase update;
  DeleteCategoryUseCase delete;

  CategoriesUseCases({
    required this.create,
    required this.getCategories,
    required this.update,
    required this.delete
    });
}