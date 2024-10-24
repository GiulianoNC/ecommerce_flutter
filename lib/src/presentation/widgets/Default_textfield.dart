import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {

  String label;
  String? initialValue;
  String? errorText;
  TextInputType? textInputType;
  IconData icon;
  Color color;
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
    this.validator,
    this.initialValue,
    this.color = Colors.white,
    TextInputType = TextInputType.text
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text){
        onChanged(text);
      },
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        label: Text(
          label,
          style: TextStyle(
            color: color
        ),
        ),
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:color!)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:color!)
        )
      ),
      style: TextStyle(
        color: color
      ),
    );
  }
}