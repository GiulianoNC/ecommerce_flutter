import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/CreateCardTokenUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/GetIdentificationTypesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/GetInstallmentsUSeCase.dart';

class MercadoPagoUseCases {

  GetIdentificationTypesUseCase getIdentificationTypes;
  CreateCardTokenUseCase createCardTokenUseCase;
  GetInstallmentsUSeCase getInstallmentsUSeCase;


  MercadoPagoUseCases({
    required this.getIdentificationTypes,
    required this.createCardTokenUseCase,
    required this.getInstallmentsUSeCase
  });

}