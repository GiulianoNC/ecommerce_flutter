import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';


//@Injectable()
class LoginUsecase {

  AuthRepository repository;
  LoginUsecase(this.repository);

  run(String email, String password) => repository.login(email, password);
}