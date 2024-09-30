import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/RegisterContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  RegisterBloc? _bloc;

@override
void dispose() {
  //_registerbloccubit?.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<RegisterBloc>(context, listen :false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state){
            final responseState = state.response;
            if(responseState is Error){
               Fluttertoast.showToast(
               msg: responseState.message,
               toastLength:Toast.LENGTH_LONG
              );
            }
            else if(responseState is Success){
              _bloc?.add(RegisterFormReset());
               Fluttertoast.showToast(
               msg: 'Registro exitoso',
               toastLength:Toast.LENGTH_LONG
               );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state){
              return Registercontent(_bloc, state);
            }),
        )
      )
    );
  }
}