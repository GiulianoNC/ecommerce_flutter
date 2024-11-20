import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClientPaymentFormState extends Equatable{

  final String cardNumber;
  final String expiredDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;

  const ClientPaymentFormState({
    this.cardNumber ="",
    this.expiredDate ="",
    this.cardHolderName ="",
    this.cvvCode ="",
    this.isCvvFocused =false,
    this.formKey
  });


  ClientPaymentFormState copyWith({
    String? cardNumber,
    String? expiredDate,
    String? cardHolderName,
    String? cvvCode,
    bool? isCvvFocused,
    GlobalKey<FormState>? formKey
  }){
    return ClientPaymentFormState(
      cardNumber: cardNumber ?? this.cardNumber,
      expiredDate: expiredDate ?? this.expiredDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvvCode: cvvCode ?? this.cvvCode,
      isCvvFocused: isCvvFocused ?? this.isCvvFocused,
      formKey: formKey
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cardNumber,expiredDate,cardHolderName, cvvCode,isCvvFocused];
}