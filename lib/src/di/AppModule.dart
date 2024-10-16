
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategorieRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/users/UpdateUsersUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';

@module
abstract class Appmodule {

  @injectable
  SharedPref get sharedPred => SharedPref();

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  UsersService get usersService => UsersService(sharedPred);

  @injectable
  AuthRepository get authRepository => Authrepositoryimpl(authservice,sharedPred);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImple(usersService);

  @injectable
  CategoriesService get categoriesService => CategoriesService(sharedPred);


  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);
  
  @injectable
  Authusecases get authusecases => Authusecases(
    login: LoginUsecase(authRepository),
    resgister: Registerusecase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

  @injectable
  UsersUseCases get usersCases => UsersUseCases(
    updateUser: UpdateUsersUseCase(usersRepository)
  );

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
    create: CreateCategoryUseCase(categoriesRepository),
    getCategories: GetcategoriesUseCase(categoriesRepository)
  );
}