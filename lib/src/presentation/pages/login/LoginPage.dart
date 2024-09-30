import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  LoginBloc? _bloc;

  @override
  void initState() { // SE EJECUTA CUANDO INICIA LA PANTALLA UNA SOLA VEZ
    super.initState();
   /* WidgetsBinding.instance.addPostFrameCallback((timeStamp){ //nos aseguramos a volver el estado de nuestros steams a su valor inicial
      _bloc?.dispose();
    });*/
  }


  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<LoginBloc>(context);

    return  Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocListener<LoginBloc,LoginState>(
          listener: (context, state){
            final responseState = state.response;
            if(responseState is Error){
               Fluttertoast.showToast(
               msg: responseState.message,
               toastLength:Toast.LENGTH_LONG
              );
            }
            else if(responseState is Success){
              _bloc?.add(LoginFormReset());
               Fluttertoast.showToast(
               msg: 'Login exitoso',
               toastLength:Toast.LENGTH_LONG
               );
            }
          },
          child: BlocBuilder<LoginBloc,LoginState>(
            builder: (context, state){
              final responseState = state.response;
              if(responseState is Loading){
                return Center(child: CircularProgressIndicator());
              }
              return Logincontent(_bloc, state);
            }
          ),
        ),
      )
    );
  }
}