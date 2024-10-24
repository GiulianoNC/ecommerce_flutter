import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategorieRepository.dart';

class UpdateCategoryUseCase {

  CategoriesRepository categoriesRepository;

  UpdateCategoryUseCase(this.categoriesRepository);

  run(int id, Category category, File? file) => categoriesRepository.update(id, category, file);
}