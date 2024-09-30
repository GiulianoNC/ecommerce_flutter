import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


//@Injectable()
class Authservice {
  //METODO LOGIN
  Future<Resource<AuthResponse>> login (String email, String password)async{
    try {
      
      //PETICION A LA RUTA http://192.168.0.21:3000/auth/login
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/auth/login');
      Map<String, String> headers ={"Content-Type": "application/json"};
      String body = json.encode({
        'email': email,
        'password': password
      });
      final response = await  http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  //REGISTER
    Future<Resource<AuthResponse>> register (user)async{
    try {
      
      //PETICION A LA RUTA http://192.168.0.21:3000/auth/register
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/auth/register');
      Map<String, String> headers ={"Content-Type": "application/json"};
      String body = json.encode(user);
      final response = await  http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      }else{
        print(listToString(data['message']).toString());
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }
}