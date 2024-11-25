import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClientPaymentInstallmentsEvent extends Equatable{

  const ClientPaymentInstallmentsEvent();

  @override
  List<Object?> get props => [];
}

class GetInstallments extends ClientPaymentInstallmentsEvent{

  final String firstSixDigits;
  final String amount;

  const GetInstallments({required this.firstSixDigits, required this.amount});

  @override
  List<Object?> get props => [firstSixDigits, amount];
}

class InstallmentsChanged extends ClientPaymentInstallmentsEvent{
  final String installment;
  const InstallmentsChanged({required this.installment});
  @override
  List<Object?> get props => [installment];

}