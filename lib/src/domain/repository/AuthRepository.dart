import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AuthRepository {

  Future<AuthResponse?> getUserSession();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>>login(String email, String password);
  Future<Resource<AuthResponse>>register(User user);// en vez de pasar todos los elementos user, mail lastname, phone... pasamos un objeto


}