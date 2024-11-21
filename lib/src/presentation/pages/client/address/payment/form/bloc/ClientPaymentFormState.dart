import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClientPaymentFormState extends Equatable{

  final String cardNumber;
  final String expiredDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;
  //final Resource? responseIdentificationTypes;
  final List<MercadoPagoIdentificationType> identificationTypes;

  const ClientPaymentFormState({
    this.cardNumber ="",
    this.expiredDate ="",
    this.cardHolderName ="",
    this.cvvCode ="",
    this.isCvvFocused =false,
    this.formKey,
    this.identificationTypes =const []
    //this.responseIdentificationTypes
  });


  ClientPaymentFormState copyWith({
    String? cardNumber,
    String? expiredDate,
    String? cardHolderName,
    String? cvvCode,
    bool? isCvvFocused,
    List<MercadoPagoIdentificationType>? identificationTypes,
    GlobalKey<FormState>? formKey,
    //Resource? responseIdentificationTypes
  }){
    return ClientPaymentFormState(
      cardNumber: cardNumber ?? this.cardNumber,
      expiredDate: expiredDate ?? this.expiredDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvvCode: cvvCode ?? this.cvvCode,
      isCvvFocused: isCvvFocused ?? this.isCvvFocused,
      identificationTypes: identificationTypes ?? this.identificationTypes,
      //responseIdentificationTypes: responseIdentificationTypes ?? this.responseIdentificationTypes,
      formKey: formKey
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cardNumber,expiredDate,cardHolderName, cvvCode,isCvvFocused,identificationTypes];
}