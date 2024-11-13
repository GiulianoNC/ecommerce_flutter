import 'package:ecommerce_flutter/src/domain/userCases/products/ProductstUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductListBloc extends Bloc<ClientProductListEvent, ClientProductListState>{

  ProductsUsesCases productsUsesCases;
  
  ClientProductListBloc(this.productsUsesCases): super(ClientProductListState()){
    on<GetProductsByCategory>(_onGetProductByCategory);
  }

  Future<void>_onGetProductByCategory(GetProductsByCategory event, Emitter<ClientProductListState> emit)async{

    emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource response = await productsUsesCases.getProductsByCategory.run(event.idCategory);
    emit(
      state.copyWith(
      response: response
      )
    );
  }


}