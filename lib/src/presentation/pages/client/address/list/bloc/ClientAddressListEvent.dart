import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:equatable/equatable.dart';

class ClientAddressListEvent extends Equatable {

const ClientAddressListEvent();

@override
  List<Object?> get props => [];
}

class GetUserAddress extends ClientAddressListEvent{
  const GetUserAddress();
}

class ChangedRadioValue extends ClientAddressListEvent{
  final int radioValue;
  final Address address;

  const ChangedRadioValue({
    required this.radioValue,
    required this.address
  });

  @override
  List<Object?> get props => [radioValue, address];
}

class SetAddressSessions extends ClientAddressListEvent{
  final List<Address> addressList;
  
  const SetAddressSessions({required this.addressList});

  @override
  // TODO: implement props
  List<Object?> get props => [addressList];
}
