import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdaeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState>{

  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc():super(ProfileUpdateState()){
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChanged>(_onNameChanged);
    on<ProfileUpdateLastNameChanged>(_onLastNameChanged);
    on<ProfileUpdatePhoneChanged>(_onPhoneChanged);
    on<ProfileUpdatePickImage>(_onPickImage);
    on<ProfileUpdateTakePhoto>(_onTakePhoto);

  }

  Future<void>?_onInitEvent(ProfileUpdateInitEvent event, Emitter<ProfileUpdateState>emit){
    emit(
      state.copyWith(
        formKey: formKey
      )
    );
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

  Future<void>?_onLastNameChanged(ProfileUpdateLastNameChanged event, Emitter<ProfileUpdateState>emit){
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value:event.lastname.value,
          error: event.lastname.value.isNotEmpty? null: 'Ingresa el apellido'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>?_onPhoneChanged(ProfileUpdatePhoneChanged event, Emitter<ProfileUpdateState>emit){
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value:event.phone.value,
          error: event.phone.value.isNotEmpty? null: 'Ingresa el telefono'
        ),
        formKey: formKey
      )
    );
  }

    Future<void>_onPickImage(ProfileUpdatePickImage event, Emitter<ProfileUpdateState>emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      emit(
        state.copyWith(
          image: File(image.path)
        )
      );
    }
  } 

    Future<void>?_onTakePhoto(ProfileUpdateTakePhoto event, Emitter<ProfileUpdateState>emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      emit(
        state.copyWith(
          image: File(image.path)
        )
      );
    }
  } 
}