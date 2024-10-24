import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryUpdateState extends Equatable{

  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final File? file;

  const AdminCategoryUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
    this.formKey,
    this.file,
    this.response
  });

  AdminCategoryUpdateState resetForm(){
    return AdminCategoryUpdateState(
      file:null
    );

  }

  toCategory() => Category(
    id : id,
    name: name.value,
    description: description.value
  );

  AdminCategoryUpdateState copyWith({
   int? id,
   BlocFormItem? name,
   BlocFormItem? description,
   GlobalKey<FormState>? formKey,
   Resource? response,
   File? file,
  }){
    return AdminCategoryUpdateState(
    id:id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    file: file ?? this.file,
    formKey: formKey,
    response: response
    
    );
  }

  @override
  List<Object?> get props => [id,name, description,file, response];
}