// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/data/dataSource/remote/services/AuthService.dart' as _i204;
import 'src/di/AppModule.dart' as _i199;
import 'src/domain/repository/AuthRepository.dart' as _i1048;
import 'src/domain/userCases/auth/AuthUseCases.dart' as _i715;

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
    gh.factory<_i204.Authservice>(() => appmodule.authservice);
    gh.factory<_i1048.AuthRepository>(() => appmodule.authRepository);
    gh.factory<_i715.Authusecases>(() => appmodule.authusecases);
    return this;
  }
}

class _$Appmodule extends _i199.Appmodule {}
