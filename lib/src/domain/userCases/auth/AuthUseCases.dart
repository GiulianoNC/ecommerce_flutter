
import 'package:ecommerce_flutter/src/domain/userCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/SaveUserSessionUseCase.dart';

//ALMACENAR TODOS LOS CASOS DE USOS
//@Injectable()
class Authusecases {

  LoginUsecase login;
  Registerusecase resgister;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;
  LogoutUseCase logout;

  Authusecases({
    required this.login,
    required this.resgister,
    required this.getUserSession,
    required this.saveUserSession,
    required this.logout
  });
}