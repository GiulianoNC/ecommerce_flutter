import 'package:ecommerce_flutter/src/domain/userCases/products/ProductstUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProductListBloc extends Bloc<AdminProductListEvent, AdminProductListState>{

  ProductsUsesCases productsUsesCases;
  
  AdminProductListBloc(this.productsUsesCases): super(AdminProductListState()){
    on<GetProductsByCategory>(_onGetProductByCategory);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void>_onGetProductByCategory(GetProductsByCategory event, Emitter<AdminProductListState> emit)async{

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

    Future<void>_onDeleteProduct(DeleteProduct event, Emitter<AdminProductListState> emit)async{
    
    
    emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource response = await productsUsesCases.delete.run(event.id);
    emit(
      state.copyWith(
      response: response
      )
    );
    }
}