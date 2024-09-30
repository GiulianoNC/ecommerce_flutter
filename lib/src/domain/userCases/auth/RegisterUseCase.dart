import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';


//@Injectable()
class Registerusecase {

  AuthRepository repository;
  Registerusecase(this.repository);

  run(User user)
   => repository.register(user);
}