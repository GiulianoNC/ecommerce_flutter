import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClientAddressListState extends Equatable{

  final Resource? response;

  const ClientAddressListState({
    this.response
  });

  ClientAddressListState copyWith({
    Resource? response
  }){
    return ClientAddressListState(response: response);
  }

  @override
  List<Object?> get props => [response];

}