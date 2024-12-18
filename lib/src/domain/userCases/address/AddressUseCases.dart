import 'package:ecommerce_flutter/src/domain/userCases/address/CreateAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/DeleteAddressFromSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/DeleteAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/GetAddressSessionUseCase%20.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/GetUserAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/SaveAdressInSessionsUseCase.dart';

class AddressUseCases {

  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;
  SaveAdressInSessionsUseCase saveAdressInSession;
  GetAddressSessionUseCase  getAddressSession;
  DeleteAddressUseCase delete;
  DeleteAddressFromSessionUseCase deleteFromSession;

  AddressUseCases({
    required this.create,
    required this.getUserAddress,
    required this.saveAdressInSession,
    required this.getAddressSession,
    required this.delete,
    required this.deleteFromSession
  
  });
}