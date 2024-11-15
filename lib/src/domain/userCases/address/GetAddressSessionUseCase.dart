import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';

class GetAddressSesionUseCase {
  AddressRepository addressRepository;


  GetAddressSesionUseCase(this.addressRepository);

  run() => addressRepository.getAddressSession();
  
}