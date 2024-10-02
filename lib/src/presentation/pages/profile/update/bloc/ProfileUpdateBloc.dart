import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdaeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState>{

  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc():super(ProfileUpdateState()){
    on<ProfileUpdateNameChanged>(_onNameChanged);
  }

  Future<void>?_onNameChanged(ProfileUpdateNameChanged event, Emitter<ProfileUpdateState>emit){
    emit(
      state.copyWith(
        name: BlocFormItem(
          value:event.name.value,
          error: event.name.value.isNotEmpty? null: 'Ingresa el nombre'
        ),
        formKey: formKey
      )
    );
  }
}