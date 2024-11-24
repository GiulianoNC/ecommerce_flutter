import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClientPaymentInstallmentsState extends Equatable{

  final Resource? response;

  ClientPaymentInstallmentsState({
    this.response
  });

  ClientPaymentInstallmentsState copyWith({
    Resource? response
  }){
    return ClientPaymentInstallmentsState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}