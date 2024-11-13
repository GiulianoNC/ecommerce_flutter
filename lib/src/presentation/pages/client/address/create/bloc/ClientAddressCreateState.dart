import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClientAddressCreateState extends Equatable{

  final GlobalKey<FormState>? formKey;
  final BlocFormItem address;
  final BlocFormItem neighborhood;

  const ClientAddressCreateState({
    this.address = const BlocFormItem(error: "Ingresa la direccion"),
    this.neighborhood = const BlocFormItem(error: "Ingresa el barrio"),
    this.formKey
  });

  ClientAddressCreateState copyWith({
    BlocFormItem? address,
    BlocFormItem? neighborhood,
    GlobalKey<FormState>? formKey
  }){
    return ClientAddressCreateState(
      address: address ?? this.address,
      neighborhood: neighborhood ?? this.neighborhood,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [address, neighborhood];

}