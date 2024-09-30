
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';

//ALMACENAR TODOS LOS CASOS DE USOS
//@Injectable()
class Authusecases {

  LoginUsecase login;
  Registerusecase resgister;

  Authusecases({
    required this.login,
    required this.resgister
  });
}