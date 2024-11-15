import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';

class SaveAdressInSessionsUseCase{

  AddressRepository addressRepository;

  SaveAdressInSessionsUseCase(this.addressRepository);

  run(Address address) => addressRepository.saveAddressInSession(address);
}