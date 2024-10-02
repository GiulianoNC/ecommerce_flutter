import 'dart:io';

import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable{

  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final File? image;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState({
    this.name = const BlocFormItem(error:'Ingresa el nombre'),
    this.lastname =const BlocFormItem(error:'Ingresa el apellido'),
    this.phone =const BlocFormItem(error:'Ingresa el telefono'),
    this.formKey,
    this.image
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    File? image,
    GlobalKey<FormState>? formKey
  }){
    return ProfileUpdateState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      image: image,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [name, lastname, phone, image];

}