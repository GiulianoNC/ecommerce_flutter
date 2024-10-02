import 'package:ecommerce_flutter/src/domain/models/Role.dart';
import 'package:flutter/material.dart';

class RolesItem extends StatelessWidget {

  Role role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamedAndRemoveUntil(context, role.route, (route)=> false);//nos permite obtener la ruta atraves de la bd
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15, top: 15),
            height: 100,
            child: FadeInImage( //nos va a permitir obtener una imagen de la bd o network
              image: NetworkImage(role.image),
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          Text(
            role.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}