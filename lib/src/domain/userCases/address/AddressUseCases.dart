import 'package:ecommerce_flutter/src/domain/userCases/address/CreateAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/GetUserAddressUseCase.dart';

class AddressUseCases {

  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;

  AddressUseCases({
    required this.create,
    required this.getUserAddress
  
  });
}