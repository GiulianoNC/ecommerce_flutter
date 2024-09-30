import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable{

  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState({
    this.name = const BlocFormItem(error: 'ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'ingresa el apellido'),
    this.email = const BlocFormItem(error: 'ingresa el email'),
    this.phone = const BlocFormItem(error: 'ingresa el telefono'),
    this.password = const BlocFormItem(error: 'ingresa el password'),
    this.confirmPassword = const BlocFormItem(error: 'Confirma el password'),
    this.formKey,
    this.response

  });

  toUser() => User(
    name: name.value,
    lastname: lastname.value,
    email: email.value,
    phone: phone.value,
    password: password.value
  );

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
    Resource? response
  }){
    return  RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
      response: response

    );
  }

  @override
  List<Object?> get props => [name, lastname, email, phone, password,confirmPassword,response];


}