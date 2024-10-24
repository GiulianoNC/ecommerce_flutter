import 'dart:io';

import 'package:ecommerce_flutter/src/domain/products/ProductstUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductUpdateBloc extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState>{
  
  ProductsUsesCases productsUsesCases;
  
  
  AdminProductUpdateBloc(this.productsUsesCases):super (AdminProductUpdateState()){
    on<AdminProductUpdateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<PriceChanged>(_onPriceChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void>? _onInitEvent(AdminProductUpdateInitEvent event, Emitter<AdminProductUpdateState> emit){
    emit(
      state.copyWith(
        id:event.product?.id,
        idCategory: event.product?.idCategory,
        name: BlocFormItem(value: event.product?.name ?? ''),
        description: BlocFormItem(value: event.product?.description ?? ''),
        price: BlocFormItem(value: event.product?.price.toString() ?? ''),
        formKey: formKey
      )
    );
  }

  Future<void>? _onNameChanged(NameChanged event, Emitter<AdminProductUpdateState> emit){
    emit(
      state.copyWith(
        name:BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>? _onDescriptionChanged(DescriptionChanged event, Emitter<AdminProductUpdateState> emit){
    emit(
      state.copyWith(
        description:BlocFormItem(
          value: event.description.value,
          error: event.description.value.isNotEmpty ? null : 'Ingresa la descripcion'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>? _onPriceChanged(PriceChanged event, Emitter<AdminProductUpdateState> emit){
  final isNumeric = double.tryParse(event.price.value) != null;

  emit(
    state.copyWith(
      price: BlocFormItem(
        value: event.price.value,
        error: (event.price.value.isNotEmpty && isNumeric) ? null : 'Ingresa un precio válido'
      ),
      formKey: formKey
    )
  );
}

  Future<void>? _onPickImage(PickImage event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      if(event.numberFile == 1){
        emit(
          state.copyWith(
            file1: File(image.path),
            formKey: formKey
          )
        );
      }else if(event.numberFile == 2){
        emit(
          state.copyWith(
            file2: File(image.path),
            formKey: formKey
          )
        );
      }
      
    }
  }

  Future<void>? _onTakePhoto(TakePhoto event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      if(event.numberFile == 1){
        emit(
          state.copyWith(
            file1: File(image.path),
            formKey: formKey
          )
        );
      }else if(event.numberFile == 2){
        emit(
          state.copyWith(
            file2: File(image.path),
            formKey: formKey
          )
        );
      }
    }
  }

  Future<void>? _onFormSubmit(FormSubmit event, Emitter<AdminProductUpdateState> emit) async {
   try{
    emit(
      state.copyWith(
        response: Loading(),
        formKey: formKey
      )
    );
    
    if(state.file1 != null && state.file2 != null){
      List<File> files=[state.file1!, state.file2!]; 
      Resource response = await productsUsesCases.create.run(state.toProduct(), files);
      emit(
      state.copyWith(
        response: response,
        formKey: formKey
      )
    );
    }else{
      emit(
      state.copyWith(
        response: Error('Sekecciona las dos imagenes'),
        formKey: formKey
      )
      );
    }
    
   }catch(e){
    emit(
      state.copyWith(
        response: Error(e.toString()),
        formKey: formKey
      )
    );
   }
   
    
  }

  Future<void>? _onResetForm(ResetForm event, Emitter<AdminProductUpdateState> emit){
    state.formKey?.currentState?.reset();
  }

  
}