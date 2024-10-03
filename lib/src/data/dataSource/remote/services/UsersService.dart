import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class UsersService {

  SharedPref sharedPref;

  UsersService(this.sharedPref);

  Future<Resource<User>>update(int id, User user) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/users/5
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/users/$id');
      String token ='';
      final userSession = await sharedPref.read('user');
       if(userSession != null){
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
       }
      
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization": token
        };
      String body = json.encode({
        'name':user.name,
        'lastname':user.lastname,
        'phone': user.phone
      });
      final response = await  http.put(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<User>>updateImage(int id, User user,File file) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/users/upload/5
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/users/upload/$id');
      String token ='';
      final userSession = await sharedPref.read('user');
       if(userSession != null){
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
       }
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] =token;
      request.files.add(http.MultipartFile(
        'file',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')

      ));
      request.fields['user']= json.encode({
        'name':user.name,
        'lastname':user.lastname,
        'phone': user.phone
      });
      final response = await request.send();
      print('RESPONSE: ${response.statusCode}');
      final data = json.decode(await response.stream.transform(utf8.decoder).first);   
      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }
}