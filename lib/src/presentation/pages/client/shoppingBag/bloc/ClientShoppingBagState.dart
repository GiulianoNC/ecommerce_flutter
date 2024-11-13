import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

class ClientShoppingBagState extends Equatable{
  final List<Product> products;

  const ClientShoppingBagState({
    this.products = const[]
  });

  ClientShoppingBagState copyWith({
    List<Product>? products
  }){
    return ClientShoppingBagState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}