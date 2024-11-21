import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRespository.dart';

class GetIdentificationTypesUseCase{

  MercadoPagoRepository mercadoPagoRepository;

  GetIdentificationTypesUseCase(this.mercadoPagoRepository);

  run() => mercadoPagoRepository.getIdentificationTypes();
}