import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductDetailBloc extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {

  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases): super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShopppingBag>(_onAddProductToShoppingBag);
    on<ResetState>(_onResetState);
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ClientProductDetailState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
     print('Número de productos obtenidos: ${products.length}');
    products.forEach((p){//vamos a recorrer producto por producto
      print('Shopping Bag ${p.toJson()}');
    });
    int index = products.indexWhere((p) => p.id == event.product.id);
    if (index != -1) {//siginifica que el producto ya fue agregado a la bolsa de compras
      emit(
        state.copyWith(quantity: products[index].quantity)//cambio de estado donde prestablezco el valor que corresponde
      );
    }
  }

  Future<void> _onAddItem(AddItem event, Emitter<ClientProductDetailState> emit) async {
    emit(
      state.copyWith(quantity: state.quantity + 1)
    );
  }

  Future<void> _onSubtractItem(SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity >= 1) {
      emit(
        state.copyWith(quantity: state.quantity - 1)
      );
    }
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShopppingBag event, Emitter<ClientProductDetailState> emit) async {
    event.product.quantity = state.quantity;
    shoppingBagUseCases.add.run(event.product);
  }

  Future<void> _onResetState(ResetState event, Emitter<ClientProductDetailState> emit) async {
    emit(
      state.copyWith(quantity: 0)
    );
  }

}