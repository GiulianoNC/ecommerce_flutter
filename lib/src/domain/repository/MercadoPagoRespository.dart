import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class MercadoPagoRepository {

  Future<Resource<List<MercadoPagoIdentificationType>>> getIdentificationTypes();
}