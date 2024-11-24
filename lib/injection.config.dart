// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/data/dataSource/local/SharedPref.dart' as _i344;
import 'src/data/dataSource/remote/services/AddressService.dart' as _i803;
import 'src/data/dataSource/remote/services/AuthService.dart' as _i204;
import 'src/data/dataSource/remote/services/CategoriesService.dart' as _i895;
import 'src/data/dataSource/remote/services/MercadoPagoService.dart' as _i558;
import 'src/data/dataSource/remote/services/ProductService.dart' as _i725;
import 'src/data/dataSource/remote/services/UsersService.dart' as _i430;
import 'src/di/AppModule.dart' as _i199;
import 'src/domain/repository/AddressRepository.dart' as _i615;
import 'src/domain/repository/AuthRepository.dart' as _i1048;
import 'src/domain/repository/CategorieRepository.dart' as _i174;
import 'src/domain/repository/MercadoPagoRespository.dart' as _i726;
import 'src/domain/repository/ProductsRepository.dart' as _i418;
import 'src/domain/repository/ShoppingBagRepository.dart' as _i303;
import 'src/domain/repository/UsersRepository.dart' as _i562;
import 'src/domain/userCases/address/AddressUseCases.dart' as _i894;
import 'src/domain/userCases/auth/AuthUseCases.dart' as _i715;
import 'src/domain/userCases/categories/CategoriesUseCases.dart' as _i842;
import 'src/domain/userCases/mercadoPago/MercadoPagoUseCases.dart' as _i1035;
import 'src/domain/userCases/products/ProductstUseCases.dart' as _i815;
import 'src/domain/userCases/shoppingBag/ShoppingBagUseCases.dart' as _i817;
import 'src/domain/userCases/users/UsersUseCases.dart' as _i364;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodule = _$Appmodule();
    gh.factory<_i344.SharedPref>(() => appmodule.sharedPred);
    gh.factoryAsync<String>(() => appmodule.token);
    gh.factory<_i204.Authservice>(() => appmodule.authservice);
    gh.factory<_i430.UsersService>(() => appmodule.usersService);
    gh.factory<_i1048.AuthRepository>(() => appmodule.authRepository);
    gh.factory<_i562.UsersRepository>(() => appmodule.usersRepository);
    gh.factory<_i895.CategoriesService>(() => appmodule.categoriesService);
    gh.factory<_i174.CategoriesRepository>(
        () => appmodule.categoriesRepository);
    gh.factory<_i725.ProductService>(() => appmodule.productService);
    gh.factory<_i558.MercadoPagoService>(() => appmodule.mercadoPagoService);
    gh.factory<_i803.AddressService>(() => appmodule.addressService);
    gh.factory<_i615.AddressRepository>(() => appmodule.addressRepository);
    gh.factory<_i726.MercadoPagoRepository>(
        () => appmodule.mercadoPagoRespository);
    gh.factory<_i418.ProductsRepository>(() => appmodule.productsRepository);
    gh.factory<_i303.ShoppingBagRepository>(
        () => appmodule.shoppingBagRepository);
    gh.factory<_i715.Authusecases>(() => appmodule.authusecases);
    gh.factory<_i364.UsersUseCases>(() => appmodule.usersCases);
    gh.factory<_i842.CategoriesUseCases>(() => appmodule.categoriesUseCases);
    gh.factory<_i815.ProductsUsesCases>(() => appmodule.productsUsesCases);
    gh.factory<_i817.ShoppingBagUseCases>(() => appmodule.shoppingBagUseCases);
    gh.factory<_i894.AddressUseCases>(() => appmodule.addressUseCases);
    gh.factory<_i1035.MercadoPagoUseCases>(() => appmodule.mercadoPagousecases);
    return this;
  }
}

class _$Appmodule extends _i199.Appmodule {}
