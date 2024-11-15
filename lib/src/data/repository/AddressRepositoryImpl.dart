import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AddressService.dart';
import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class AddressRepositoryImpl implements AddressRepository{
  
  AddressService addressService;
  
  AddressRepositoryImpl(this.addressService);

  @override
  Future<Resource<Address>> create(Address address) {
    return addressService.create(address);
  }
  
  @override
  Future<Resource<List<Address>>> getUserAddress(int idUser) {
    return addressService.getUserAddress(idUser);
  }

}