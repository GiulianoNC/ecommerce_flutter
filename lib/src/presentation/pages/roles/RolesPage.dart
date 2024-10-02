import 'package:ecommerce_flutter/src/domain/models/Role.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rolespage extends StatelessWidget {
  const Rolespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RolesBloc,RolesState>(//
        builder: (context, state){
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: ListView( //vamos a mostrar varios elementos
              shrinkWrap: true,
              children:state.roles != null ? //preguntemos si state.roles es diferente de nulo
              (state.roles?.map((Role? role){ //vamos a mapear la lista donde nos devuelve un objeto rol
                return role != null ? RolesItem(role) : Container();//y nos retorna el rolesItem, donde recibe el rol
              }).toList())as List<Widget>: [], //sino traeme un arreglo vacio
            ),
          );
        }
      ) 
    );
  }
}