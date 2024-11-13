import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/GetTotalShoppingBagUseCase.dart';

class ShoppingBagUseCases{

  AddShoppingBagUseCase add;
  GetProductsShoppingBagUseCase getProducts;
  DeleteItemShoppinBagUseCase deleteItem;
  DeleteShoppingBagUseCase deleteShoppingBag;
  GetTotalShoppingBagUseCase getTotal;

  ShoppingBagUseCases({
    required this.add,
    required this.getProducts,
    required this.deleteItem,
    required this.deleteShoppingBag,
    required this.getTotal
  });


}