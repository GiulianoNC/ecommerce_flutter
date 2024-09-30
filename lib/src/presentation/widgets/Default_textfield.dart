import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {

  String label;
  String? errorText;
  IconData icon;
  Function(String text) onChanged;
  bool obscureText;//PARA LA CONTRASEÑA
  String? Function(String?)? validator;

  DefaultTextfield({
    Key?key,
    required this.label,
    this.errorText ='',
    required this.icon,
    required this.onChanged,//FUNCION PARA CAPTAR LO QUE SE INGRESE EN LOS CAMPOS
    this.obscureText= false,
    this.validator
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: (text){
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white
        ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.white)
        )
      ),
      style: TextStyle(
        color: Colors.white
      ),
    );
  }
}