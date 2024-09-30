
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/repository/AuthRepositoryImpl.dart';

@module
abstract class Appmodule {

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  AuthRepository get authRepository => Authrepositoryimpl(authservice);

  @injectable
  Authusecases get authusecases => Authusecases(
    login: LoginUsecase(authRepository),
    resgister: Registerusecase(authRepository)
  );
}