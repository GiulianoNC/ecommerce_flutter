import 'package:ecommerce_flutter/src/domain/repository/CategorieRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CategoriesUseCases.dart';

class GetcategoriesUseCase {

  CategoriesRepository categoriesRepository;

  GetcategoriesUseCase(this.categoriesRepository);

  run() => categoriesRepository.getCategories();


}