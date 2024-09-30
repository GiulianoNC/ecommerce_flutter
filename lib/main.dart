import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/BlocProviders.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/LoginPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login':(BuildContext context) => Loginpage(),
          'register':(BuildContext context) => Registerpage()
      
        },
      ),
    );
  }
}

