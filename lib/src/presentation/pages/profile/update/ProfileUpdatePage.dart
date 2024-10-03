import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {

  ProfileUpdateBloc? _bloc;
  User? user;

  @override
  void initState() {//una sola vez cuando la pantalla es mostrada
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){//esperar hasatq ue la pantalla cargue totalmente, para tener las instancias
      print('Disparando ProfileUpdateInitEvent con user: $user');
      _bloc?.add(ProfileUpdateInitEvent(user: user));
    })
    ;
    
  }
  @override
  Widget build(BuildContext context) {// se dispara despues del init, varias veces
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: BlocListener<ProfileUpdateBloc,ProfileUpdateState>(
        listener: (context, state){
          final responseState= state.response;
          if(responseState is Error){
            print('Actualizacion erronea: ${responseState.message}');
            Fluttertoast.showToast(
              msg: 'Actualizacion erronea: $responseState.message',
              toastLength: Toast.LENGTH_LONG
            );
          }else if (responseState is Success){
            Fluttertoast.showToast(
              msg: 'Actualizacion exitosa',
              toastLength: Toast.LENGTH_LONG
            );
          }else if (responseState is Loading) {
            // Puedes agregar un manejo de carga si lo deseas
              print('Cargando...');
          }
        },
        child: BlocBuilder<ProfileUpdateBloc,ProfileUpdateState>(
          builder: (context,state) {
            final responseState = state.response;
                if(responseState is Loading){
                  return Stack(
                    children: [
                      ProfileUpdateContent(_bloc, state, user),
                      Center(child: CircularProgressIndicator())
                    ],
                  );
                }
          return ProfileUpdateContent(_bloc, state, user);
          }
        ),
        
      )
    );
  }
}