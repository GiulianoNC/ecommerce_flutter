import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesBloc extends Bloc<RolesEvent,RolesState>{

  Authusecases authusecases;//inyectar authusecases para usar sus casos de usos

   RolesBloc(this.authusecases): super(RolesState()){//constructor para manejar los estadps
    on<GetRolesList>(_onGetRolesList);//para los eventos
   }

   Future<void> _onGetRolesList(GetRolesList event, Emitter<RolesState> emit)async{
    AuthResponse? authResponse = await authusecases.getUserSession.run();//obtener los roles d
    emit(//emitiendo la lista de roles
      state.copyWith(
        roles: authResponse?.user.roles
      )
    );
   }
}