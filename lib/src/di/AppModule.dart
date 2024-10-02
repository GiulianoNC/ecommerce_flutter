
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';

@module
abstract class Appmodule {

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  SharedPref get sharedPred => SharedPref();

  @injectable
  AuthRepository get authRepository => Authrepositoryimpl(authservice,sharedPred);

  @injectable
  Authusecases get authusecases => Authusecases(
    login: LoginUsecase(authRepository),
    resgister: Registerusecase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );
}