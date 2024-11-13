import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppingbagUseCase {

  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppingbagUseCase(this.shoppingBagRepository);

  run()=> shoppingBagRepository.deleteShoppingBag();

}