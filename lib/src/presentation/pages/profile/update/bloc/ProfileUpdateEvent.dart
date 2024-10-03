import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileUpdateEvent extends Equatable{

  const  ProfileUpdateEvent();

  @override
  List<Object?> get props => [];
  
}

class ProfileUpdateUserSession extends ProfileUpdateEvent{
  final User user;

  const ProfileUpdateUserSession ({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileUpdateInitEvent extends ProfileUpdateEvent{
  final User? user;
  const ProfileUpdateInitEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileUpdateNameChanged extends ProfileUpdateEvent{

  final BlocFormItem name;
  const ProfileUpdateNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class ProfileUpdateLastNameChanged extends ProfileUpdateEvent{

  final BlocFormItem lastname;
  const ProfileUpdateLastNameChanged({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class ProfileUpdatePhoneChanged extends ProfileUpdateEvent{

  final BlocFormItem phone;
  const ProfileUpdatePhoneChanged({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class ProfileUpdateFormSubmit extends ProfileUpdateEvent {
  const ProfileUpdateFormSubmit();
}

class ProfileUpdatePickImage extends ProfileUpdateEvent {
  const ProfileUpdatePickImage();
}

class ProfileUpdateTakePhoto extends ProfileUpdateEvent {
  const ProfileUpdateTakePhoto();
}