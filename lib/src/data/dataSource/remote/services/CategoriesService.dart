import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class CategoriesService{
 

  SharedPref sharedPref;

  CategoriesService(this.sharedPref);


  Future<Resource<Category>>create(Category category,File file) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/categories
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/categories');
      String token ='';
      // Recuperar el token del usuario almacenado
      final userSession = await sharedPref.read('user');
      print('User session: $userSession');

      if(userSession != null){
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
        await sharedPref.save('user', authResponse.toJson());
        print('Token almacenado: ${authResponse.token}');

        }else{
        // Si no hay sesión, devuelve un error
        return Error('No hay sesión activa. Por favor, inicia sesión nuevamente.');
        }
        // Configuración de la solicitud
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] =token;
      // Agregar el archivo
      request.files.add(http.MultipartFile(
        'file',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
      ));
      print('Category ${category.toJson()}' );
      // Agregar campos adicionales
      request.fields['name']= category.name;
      request.fields['description']= category.description;
      // Enviar la solicitud
      final response = await request.send();
      print('RESPONSE: ${response.statusCode}');

      // Leer los datos de la respuesta
      final data = json.decode(await response.stream.transform(utf8.decoder).first);   
      // Verificar el estado de la respuesta
      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        Category categoryResponse = Category.fromJson(data);
        return Success(categoryResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<List<Category>>>getCategories() async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/categories
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/categories');
      //obteniendo el token
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
      
      final response = await  http.get(url, headers: headers);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        List<Category>categories = Category.fromJsonList(data);
        return Success(categories);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
    }

}