import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders =[
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<Authusecases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<Authusecases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<Authusecases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<Authusecases>())),
  BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<Authusecases>())..add(ProfileInfoGetUser())),
  
  
];