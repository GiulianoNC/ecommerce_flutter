import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClientPaymentInstallmentsState extends Equatable{

  final Resource? response;
  final String? installments;

  ClientPaymentInstallmentsState({
    this.response,
    this.installments
  });

  ClientPaymentInstallmentsState copyWith({
    Resource? response,
    String? installments
  }){
    return ClientPaymentInstallmentsState(
      response: response ?? this.response,
      installments: installments ?? this.installments
      );
  }

  @override
  List<Object?> get props => [response, installments];
}