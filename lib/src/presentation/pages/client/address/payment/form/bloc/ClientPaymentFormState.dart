import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClientPaymentFormState extends Equatable{

  final String cardNumber;
  final String expiredDate;
  final String cardHolderName;
  final String cvvCode;
  final String? identificationType;
  final String identificationNumber;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final List<MercadoPagoIdentificationType> identificationTypes;
  final double totalToPay;

  const ClientPaymentFormState({
    this.cardNumber ="",
    this.expiredDate ="",
    this.cardHolderName ="",
    this.cvvCode ="",
    this.identificationType,
    this.identificationNumber="",
    this.isCvvFocused =false,
    this.formKey,
    this.identificationTypes =const [],
    this.response,
    this.totalToPay = 0
  });

  toCardTokenBody() => MercadoPagoCardTokenBody(
    cardNumber: cardNumber.replaceAll(RegExp(' '),""), //cualquier expacio en blanco sea eliminado
    expirationYear: '20${expiredDate.split('/')[1]}', 
    expirationMonth: int.parse(expiredDate.split('/')[0]), 
    securytyCode: cvvCode, 
    cardholder: Cardholder(
      name: cardHolderName, 
      identification: Identification(
        number: identificationNumber, 
        type: identificationType ?? ""
        )
      )
  );


  ClientPaymentFormState copyWith({
    String? cardNumber,
    String? expiredDate,
    String? cardHolderName,
    String? cvvCode,
    bool? isCvvFocused,
    List<MercadoPagoIdentificationType>? identificationTypes,
    GlobalKey<FormState>? formKey,
    String? identificationType,
    String? identificationNumber,
    Resource? response,
    double? totalToPay
  }){
    return ClientPaymentFormState(
      cardNumber: cardNumber ?? this.cardNumber,
      expiredDate: expiredDate ?? this.expiredDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvvCode: cvvCode ?? this.cvvCode,
      isCvvFocused: isCvvFocused ?? this.isCvvFocused,
      identificationTypes: identificationTypes ?? this.identificationTypes,
      identificationType: identificationType ?? this.identificationType,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      response: response ?? this.response,
      formKey: formKey,
      totalToPay : totalToPay ?? this.totalToPay
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cardNumber,expiredDate,cardHolderName, cvvCode,isCvvFocused,identificationTypes,identificationType,identificationNumber,response, totalToPay];
}