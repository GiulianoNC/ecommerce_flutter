import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AddressRepository{

  Future<Resource<Address>>create(Address address);
  Future<Resource<List<Address>>>getUserAddress(int idUser);
  Future<void>saveAddressSession(Address address);
  Future<Address?>getAddressSession();
}