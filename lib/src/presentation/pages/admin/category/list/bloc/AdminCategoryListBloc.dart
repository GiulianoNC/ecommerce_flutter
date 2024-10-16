import 'package:ecommerce_flutter/src/domain/userCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryListBloc extends Bloc<AdminCategoryListEvent, AdminCategoryListState>{

  CategoriesUseCases categoriesUseCases;

  AdminCategoryListBloc(this.categoriesUseCases): super(AdminCategoryListState()){
    on<GetCategories> (_onGetCategories);
  }

  Future<void> _onGetCategories(GetCategories event, Emitter<AdminCategoryListState> emit)async{
    emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource response = await categoriesUseCases.getCategories.run();
    emit(
      state.copyWith(
        response: response
      )
    );  
  }

}