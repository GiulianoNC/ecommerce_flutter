import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:injectable/injectable.dart';

//@Injectable(as: AuthRepository)
class Authrepositoryimpl implements AuthRepository {

  Authservice authservice;

  Authrepositoryimpl(this.authservice);//con esta inyeccion, insertamos todos los metodos de authservice

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authservice.register(user);
  }


}