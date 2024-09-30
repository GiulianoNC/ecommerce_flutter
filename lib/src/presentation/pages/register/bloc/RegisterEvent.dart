import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
  @override
  List<Object?> get props =>[];
  
}

class RegisterInitEvent extends RegisterEvent{
  const RegisterInitEvent();
}
//registrar primer evento de cambio de mail
class RegisterEmailChanged extends RegisterEvent{
  final BlocFormItem email;
  const RegisterEmailChanged({required this.email} );

  @override
  List<Object?> get props => [email];
}

//registrar segundo evento de cambio de password
class RegisterPasswordChanged extends RegisterEvent{
  final BlocFormItem password;
  const RegisterPasswordChanged({required this.password} );

  @override
  List<Object?> get props => [password];
}

class RegisterNameChanged extends RegisterEvent{
  final BlocFormItem name;
  const RegisterNameChanged({required this.name} );

  @override
  List<Object?> get props => [name];
}

class RegisterLastNameChanged extends RegisterEvent{
  final BlocFormItem lastname;
  const RegisterLastNameChanged({required this.lastname} );

  @override
  List<Object?> get props => [lastname];
}

class RegisterPhoneChanged extends RegisterEvent{
  final BlocFormItem phone;
  const RegisterPhoneChanged({required this.phone} );

  @override
  List<Object?> get props => [phone];
}

class RegisterConfirmPasswordChanged extends RegisterEvent{
  final BlocFormItem confirmPassword;
  const RegisterConfirmPasswordChanged({required this.confirmPassword} );

  @override
  List<Object?> get props => [confirmPassword];
}

class RegisterFormSubmit extends RegisterEvent{
  const RegisterFormSubmit();
}

class RegisterFormReset extends RegisterEvent{
  const RegisterFormReset();
}