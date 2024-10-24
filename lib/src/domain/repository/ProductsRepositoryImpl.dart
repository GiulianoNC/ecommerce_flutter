import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class ProductsRepositoryImpl implements ProductsRepository{

  ProductService productService;

  ProductsRepositoryImpl(this.productService);

  @override
  Future<Resource<Product>>? create(Product product, List<File> files) {
    return productService.create(product, files);
  }
  
  @override
  Future<Resource<List<Product>>>? getProductsByCategory(int idCategory) {
    return productService.getProductsByCategory(idCategory);
  }

}