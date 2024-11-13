import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

class ClientProductDetailEvent extends Equatable{
  const ClientProductDetailEvent();
  
  @override
  List<Object?> get props => [];
}

class ResetState extends ClientProductDetailEvent{
  const ResetState();
}

class ClientProductDetailInitEvent extends ClientProductDetailEvent{
  const ClientProductDetailInitEvent();
  @override
  List<Object?> get props => []; 
}

class GetProducts extends ClientProductDetailEvent{
  final Product product;
  const GetProducts({required this.product});

  @override
  List<Object?> get props => [product];
}

class AddItem extends ClientProductDetailEvent{
  
  const AddItem();
  @override
  List<Object?> get props => [];
}

class SubtractItem extends ClientProductDetailEvent{
  
  const SubtractItem();
   @override
  List<Object?> get props => [];
}

//Para agregar el producto al carrito
class AddProductToShopppingBag extends ClientProductDetailEvent{
  final Product product;
  const AddProductToShopppingBag({required this.product});

  @override
  List<Object?> get props => [product];
  
}