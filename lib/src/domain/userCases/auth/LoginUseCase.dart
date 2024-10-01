import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';


class LoginUsecase {

  AuthRepository repository;
  LoginUsecase(this.repository);

  run(String email, String password) => repository.login(email, password);
}