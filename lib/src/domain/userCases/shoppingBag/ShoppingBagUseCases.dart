import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/GetProductsShoppingBagUseCase.dart';

class ShoppingBagUseCases{

  AddShoppingBagUseCase add;
  GetProductsShoppingBagUseCase getProducts;
  DeleteItemShoppingbagUseCase deleteItem;
  DeleteShoppingBagUseCase deleteShoppingBag;

  ShoppingBagUseCases({
    required this.add,
    required this.getProducts,
    required this.deleteItem,
    required this.deleteShoppingBag
  });


}