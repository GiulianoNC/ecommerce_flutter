
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AddressService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/data/repository/AddressRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/ShoppingBagREpositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/CreateAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/DeleteAddressFromSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/DeleteAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/GetAddressSessionUseCase%20.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/GetUserAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/SaveAdressInSessionsUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/DeleteProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/ProductstUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/UpdateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategorieRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/users/UpdateUsersUseCase.dart';
import 'package:ecommerce_flutter/src/domain/userCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';

@module
abstract class Appmodule {

  @injectable
  SharedPref get sharedPred => SharedPref();

  @injectable
  Future<String> get token async{
    String token ='';
    final userSession = await sharedPred.read('user');
    if(userSession != null){
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
    }
    return token;  
  }

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  AuthRepository get authRepository => Authrepositoryimpl(authservice,sharedPred);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImple(usersService);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);

  @injectable
  ProductService get productService => ProductService(token);

  @injectable
  AddressService get addressService => AddressService(token);

  @injectable
  AddressRepository get addressRepository => AddressRepositoryImpl(addressService,sharedPred);

  @injectable
  ProductsRepository get productsRepository => ProductsRepositoryImpl(productService);
 
  @injectable
  ShoppingBagRepository get shoppingBagRepository => ShoppingBagRepositoryImpl(sharedPred);


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
    getCategories: GetcategoriesUseCase(categoriesRepository),
    update: UpdateCategoryUseCase(categoriesRepository),
    delete: DeleteCategoryUseCase(categoriesRepository)
  );

  @injectable
  ProductsUsesCases get productsUsesCases => ProductsUsesCases(
    create: CreateProductUseCase(productsRepository),
    getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
    update: UpdateProductUseCase(productsRepository),
    delete: DeleteProductUseCase(productsRepository)
  );

  @injectable
  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases(
    add: AddShoppingBagUseCase(shoppingBagRepository),
    getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
    deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
    deleteShoppingBag: DeleteShoppingBagUseCase(shoppingBagRepository),
    getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository),
  );

  @injectable
  AddressUseCases get addressUseCases => AddressUseCases(
    create:CreateAddressUseCase(addressRepository),
    getUserAddress: GetUserAddressUseCase(addressRepository),
    saveAdressInSession: SaveAdressInSessionsUseCase(addressRepository),
    getAddressSession: GetAddressSessionUseCase (addressRepository),
    delete: DeleteAddressUseCase(addressRepository),
    deleteFromSession: DeleteAddressFromSessionUseCase(addressRepository)
  );
}