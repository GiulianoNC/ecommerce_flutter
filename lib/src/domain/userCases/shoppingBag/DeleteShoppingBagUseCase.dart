import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';

class DeleteShoppingBagUseCase{

  ShoppingBagRepository shoppingBagRepository;

  DeleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();

}