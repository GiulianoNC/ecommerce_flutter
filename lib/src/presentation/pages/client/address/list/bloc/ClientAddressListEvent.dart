import 'package:equatable/equatable.dart';

class ClientAddressListEvent extends Equatable {

const ClientAddressListEvent();

@override
  List<Object?> get props => [];
}

class GetUserAddress extends ClientAddressListEvent{
  const GetUserAddress();
}

