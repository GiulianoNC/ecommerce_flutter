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
          _imageBackground(context),
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
                  _iconPerson(),
                  _textRegister(),
                  _textFieldName(),
                  _textFieldLastName(),
                  _textFieldEmail(),
                  _textFieldPhone(),
                  _textFieldPassword(),
                  _textFieldConfirmPassword(),
                  _buttonRegister(context)                  
                ],
              ),
            ),            
          )
        ],
      ),
    );     
  }

  Widget _imageBackground(BuildContext context){
    return Image.asset(
      'assets/img/background.jpg',
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }
  
  Widget _iconPerson(){
    return Icon(
      Icons.person,
      color: Colors.white,
      size: 125,  
    );
  }

  Widget _textRegister(){
    return Text(
      'Register',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _textFieldName(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        label: 'Nombre',
        icon: Icons.person,
        onChanged: (text){
          bloc?.add(RegisterNameChanged(name: BlocFormItem(value: text)));
        }),
    );
  }

  Widget _textFieldLastName(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        label: 'Apellido',
        icon: Icons.person,
        onChanged: (text){
          bloc?.add(RegisterLastNameChanged(lastname: BlocFormItem(value:text)));
        }),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        label: 'Email',
        icon: Icons.email,
        //errorText: snapshot.error?.toString(),
        onChanged: (text){
          bloc?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
        }),
    );
  }


  Widget _textFieldPhone(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        label: 'Telefono',
        icon: Icons.phone,
        //errorText: snapshot.error?.toString(),
        onChanged: (text){
          bloc?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
        }),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        obscureText: false,
        label: 'Contraseña',
        //errorText: snapshot.error?.toString(),
        icon: Icons.lock,
        onChanged: (text){
          bloc?.add(RegisterPasswordChanged(password: BlocFormItem(value: text)));
        }),
    );
  }

  Widget _textFieldConfirmPassword(){
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextfield(
        obscureText: false,
        label: 'Confirmar Contraseña',
        //errorText: snapshot.error?.toString(),
        icon: Icons.lock_clock_outlined,
        onChanged: (text){
          bloc?.add(RegisterConfirmPasswordChanged(confirmPassword: BlocFormItem(value: text)));
        }),
    );
  }

  Widget _buttonRegister(BuildContext context){
    return Container(
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
    );
  }

}
