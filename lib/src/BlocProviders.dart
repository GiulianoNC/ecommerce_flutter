import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders =[
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<Authusecases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<Authusecases>())..add(RegisterInitEvent())),
  
  
];