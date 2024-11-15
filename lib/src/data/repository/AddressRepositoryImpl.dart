import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AddressService.dart';
import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class AddressRepositoryImpl implements AddressRepository{
  
  AddressService addressService;
  SharedPref sharedPref;
  
  AddressRepositoryImpl(this.addressService, this.sharedPref);

  @override
  Future<Resource<Address>> create(Address address) {
    return addressService.create(address);
  }
  
  @override
  Future<Resource<List<Address>>> getUserAddress(int idUser) {
    return addressService.getUserAddress(idUser);
  }
  
  @override
  Future<void> saveAddressSession(Address address) async{
    await sharedPref.save('address', address.toJson());
  }
  
  @override
  Future<Address?> getAddressSession()async {
    final data= await sharedPref.read('address');
    if(data != null){
      Address address = Address.fromJson(data);
      return address;
    }
    return null;
  }

}