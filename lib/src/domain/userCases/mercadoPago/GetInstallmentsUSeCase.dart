import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRespository.dart';

class GetInstallmentsUSeCase{

  MercadoPagoRepository mercadoPagoRepository;

  GetInstallmentsUSeCase(this.mercadoPagoRepository);

  run(String firstSixDigits, String amount) => mercadoPagoRepository.getInstallments(firstSixDigits, amount); 
}