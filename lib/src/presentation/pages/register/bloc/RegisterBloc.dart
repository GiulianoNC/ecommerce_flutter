import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  Authusecases authusecases;
  
  RegisterBloc(this.authusecases): super(RegisterState()){
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPassword);
    on<RegisterFormSubmit>(_onFormSubmit);
    on<RegisterFormReset>(_onFormReset);    
  }

  final formKey = GlobalKey<FormState>();  

  Future<void> _onInitEvent (RegisterInitEvent event, Emitter<RegisterState> emit) async{
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged (RegisterNameChanged event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty && event.name.value.length >= 6  ? null : "Ingesa el password"
          ),
          
        formKey: formKey
    ));    
  } 

  Future<void> _onLastNameChanged (RegisterLastNameChanged event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty && event.lastname.value.length >= 6  ? null : "Ingesa el password"
          ),
          
        formKey: formKey
    ));     
  } 

  Future<void> _onPhoneChanged (RegisterPhoneChanged event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty && event.phone.value.length >= 6  ? null : "Ingesa el password"
          ),
          
        formKey: formKey
    ));       
  }

    
  
  Future<void> _onEmailChanged (RegisterEmailChanged event, Emitter<RegisterState> emit) async{
  emit(
    state.copyWith(
      email: BlocFormItem(
        value: event.email.value,
        error: event.email.value.isNotEmpty ? null : "Ingresa el email"
        ),
      formKey: formKey
  ));
  }


  Future<void> _onPasswordChanged (RegisterPasswordChanged event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isNotEmpty && event.password.value.length >= 6  ? null : "Ingesa el password"
          ),
          
        formKey: formKey
    ));
  }

  Future<void> _onConfirmPassword (RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.confirmPassword.value,
          error: event.confirmPassword.value.isNotEmpty && event.confirmPassword.value.length >= 6  ? null : "Ingesa el password"
          ),
          
        formKey: formKey
    ));        
  }

  Future<void> _onFormSubmit (RegisterFormSubmit event, Emitter<RegisterState> emit) async{
    emit(
      state.copyWith(
        response: Loading(),
        formKey: formKey
      )
    );
    Resource response = await authusecases.resgister.run(state.toUser());
    emit(
      state.copyWith(
        response: response,
        formKey: formKey
        ),
      );
  }  

  Future<void> _onFormReset (RegisterFormReset event, Emitter<RegisterState> emit) async{
    state.formKey?.currentState?.reset();
  }   

}