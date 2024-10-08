import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';


//para comparar equatable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}
class InitEvent extends LoginEvent{
  const InitEvent();
}

//para resetear el formulario de login
class LoginFormReset extends LoginEvent{
  const LoginFormReset();
}

class LoginSaveUserSession extends LoginEvent{
  final AuthResponse authResponse;
  const LoginSaveUserSession({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}

//registrar primer evento de cambio de mail
class EmailChanged extends LoginEvent{
  final BlocFormItem email;
  const EmailChanged({required this.email} );

  @override
  List<Object?> get props => [email];
}

//registrar segundo evento de cambio de password
class PasswordChanged extends LoginEvent{
  final BlocFormItem password;
  const PasswordChanged({required this.password} );

  @override
  List<Object?> get props => [password];
}

//registrtra evento al accionar login
class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}