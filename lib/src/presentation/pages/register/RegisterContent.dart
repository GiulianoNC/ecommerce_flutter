import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registercontent extends StatelessWidget {
  
  RegisterBloc? bloc;
  RegisterState state;

  Registercontent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/background.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.7),
            colorBlendMode: BlendMode.darken,
          ),
          DefaultIconBack(
            left: 1,
            top: 20
            ),
          Container(
            height: MediaQuery.of(context).size.height* 0.75,
            width: MediaQuery.of(context).size.width * 0.85,  
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      label: 'Nombre',
                      //errorText: snapshot.error?.toString(),
                      icon: Icons.person,
                      onChanged: (text){
                        bloc?.add(RegisterNameChanged(name: BlocFormItem(value: text)));
                      }),
                  ),
                    Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      label: 'Apellido',
                      icon: Icons.person,
                      //errorText: snapshot.error?.toString(),
                      onChanged: (text){
                        bloc?.add(RegisterLastNameChanged(lastname: BlocFormItem(value:text)));
                      }),
                  ),
                    Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      label: 'Email',
                      icon: Icons.email,
                      //errorText: snapshot.error?.toString(),
                      onChanged: (text){
                        bloc?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
                      }),
                  ),
                    Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      label: 'Telefono',
                      icon: Icons.phone,
                      //errorText: snapshot.error?.toString(),
                      onChanged: (text){
                        bloc?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
                      }),
                  ),
                    Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      obscureText: false,
                      label: 'Contraseña',
                      //errorText: snapshot.error?.toString(),
                      icon: Icons.lock,
                      onChanged: (text){
                        bloc?.add(RegisterPasswordChanged(password: BlocFormItem(value: text)));
                      }),
                  ),
                    Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextfield(
                      obscureText: false,
                      label: 'Confirmar Contraseña',
                      //errorText: snapshot.error?.toString(),
                      icon: Icons.lock_clock_outlined,
                      onChanged: (text){
                        bloc?.add(RegisterConfirmPasswordChanged(confirmPassword: BlocFormItem(value: text)));
                      }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25,top: 25),
                    child: Defaultbutton(
                      text: 'REGISTRARSE',
                      color: Colors.black,//state.formKey!.currentState!.validate() ? Colors.black : Colors.grey,
                      onPressed: (){
                        if(state.formKey!.currentState!.validate()){
                          bloc?.add(RegisterFormSubmit());
                        }else{
                          Fluttertoast.showToast(
                            msg: 'El formulario no es válido',
                            toastLength: Toast.LENGTH_LONG
                          );
                          
                        }
                      }),
                  )
                ],
              ),
            ),            
          )
        ],
      ),
    );     
  }
}