import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductCreateState extends Equatable{

  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  File? file1;
  File? file2;

  AdminProductCreateState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
    this.price = const BlocFormItem(error: 'Ingresa el precio'),
    this.idCategory = 0,
    this.formKey,
    this.file1,
    this.file2,
    this.response
  });

  toProduct() => Product(
    name: name.value,
    description: description.value,
    price: double.tryParse(price.value) ?? 0.0, // Asignar 0.0 si no es válido
    idCategory: idCategory
  );

  AdminProductCreateState resetForm(){
    return AdminProductCreateState(
      name: const BlocFormItem(error :'Ingresa el nombre'),
      description: const BlocFormItem(error: 'Ingresa la descripción'),
      price: const BlocFormItem(error: 'Ingresa el precio'), 
    );

  }

  AdminProductCreateState copyWith({
   int? idCategory,
   BlocFormItem? name,
   BlocFormItem? description,
   BlocFormItem? price,
   GlobalKey<FormState>? formKey,
   Resource? response,
   File? file1,
   File? file2,
  }){
    return AdminProductCreateState(
      idCategory:  idCategory ??  this.idCategory,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    file1: file1 ?? this.file1,
    file2: file2 ?? this.file2,
    formKey: formKey,
    response: response
    
    );
  }

  @override
  List<Object?> get props => [idCategory,name, description, price,file1, file2, response];
}