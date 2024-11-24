import 'package:ecommerce_flutter/src/data/dataSource/remote/services/MercadoPagoService.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRespository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class MercadoPagoRepoositoryImpl implements MercadoPagoRepository{
  
  MercadoPagoService mercadoPagoService;

  MercadoPagoRepoositoryImpl(this.mercadoPagoService);
  
  @override
  Future<Resource<List<MercadoPagoIdentificationType>>> getIdentificationTypes() {
    return mercadoPagoService.getIdentificationTypes();
  }
  
  @override
  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(MercadoPagoCardTokenBody mercadoPagoCardTokenBody) {
    return mercadoPagoService.createCardToken(mercadoPagoCardTokenBody);
  }

  @override
  Future<Resource<MercadoPagoInstallments>> getInstallments(String firstSixDigits, String amount) {
    return mercadoPagoService.getInstallments(firstSixDigits, amount);
  }

 


}