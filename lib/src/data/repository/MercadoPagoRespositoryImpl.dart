import 'package:ecommerce_flutter/src/data/dataSource/remote/MercadoPagoService.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRespository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class MercadoPagoRepoositoryImpl implements MercadoPagoRepository{
  
  MercadoPagoService mercadoPagoService;

  MercadoPagoRepoositoryImpl(this.mercadoPagoService);
  
  @override
  Future<Resource<List<MercadoPagoIdentificationType>>> getIdentificationTypes() {
    return mercadoPagoService.getIdentificationTypes();
  }


}