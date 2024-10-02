import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent,AdminHomeState>{
  
  Authusecases? authusecases;

  AdminHomeBloc(Authusecases): super(AdminHomeState()){
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
    on<AdminLogout>(_onAdminLogout);
  }
  
  Future<void>_onAdminChangeDrawerPage(AdminChangeDrawerPage event, Emitter<AdminHomeState> emit)async{
    emit(
      state.copyWith(
        pageIndex: event.pageIndex
      )
    );
  }

  Future<void>_onAdminLogout(AdminLogout event, Emitter<AdminHomeState> emit)async{
    await authusecases?.logout.run();
  }
}