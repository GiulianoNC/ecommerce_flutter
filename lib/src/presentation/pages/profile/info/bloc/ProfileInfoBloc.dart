import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState>{

  Authusecases authusecases;

  ProfileInfoBloc(this.authusecases): super (ProfileInfoState()){
    on<ProfileInfoGetUser>(_onGetUser);
  }

  Future<void> _onGetUser(ProfileInfoGetUser event, Emitter<ProfileInfoState> emit)async{
    AuthResponse authResponse = await authusecases.getUserSession.run();
    emit(
      state.copyWith(
        user: authResponse.user
      )
    );
  }
}