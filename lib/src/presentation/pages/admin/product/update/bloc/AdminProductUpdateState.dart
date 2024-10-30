import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateState extends Equatable{

  final int id;
  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final List<int>? imagesToUpdate;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  File? file1;
  File? file2;

  AdminProductUpdateState({
    this.id =0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
    this.price = const BlocFormItem(error: 'Ingresa el precio'),
    this.idCategory = 0,
    this.formKey,
    this.file1,
    this.file2,
    this.imagesToUpdate,
    this.response
  });

  toProduct() => Product(
    id : id,
    name: name.value,
    description: description.value,
    price: double.tryParse(price.value) ?? 0.0, // Asignar 0.0 si no es válido
    idCategory: idCategory
  );

  AdminProductUpdateState resetForm(){
    return AdminProductUpdateState(
      name: const BlocFormItem(error :'Ingresa el nombre'),
      description: const BlocFormItem(error: 'Ingresa la descripción'),
      price: const BlocFormItem(error: 'Ingresa el precio'), 
    );

  }

  AdminProductUpdateState copyWith({
   int? id,
   int? idCategory,
   BlocFormItem? name,
   BlocFormItem? description,
   BlocFormItem? price,
   GlobalKey<FormState>? formKey,
   Resource? response,
   File? file1,
   File? file2,
   List<int>? imagesToUpdate
  }){
    return AdminProductUpdateState(
    id: id ?? this.id,
    idCategory:  idCategory ??  this.idCategory,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    file1: file1 ?? this.file1,
    file2: file2 ?? this.file2,
    formKey: formKey,
    response: response,
    imagesToUpdate: imagesToUpdate ?? this.imagesToUpdate
    
    );
  }

  @override
  List<Object?> get props => [ idCategory,name, description, price,file1, file2, response];
}