import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class ProductService{

  Future<String>token;

  ProductService(this.token);

  Future<Resource<Product>>create(Product product,List<File> files) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/products
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products');      
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] =await token;
      files.forEach((file) async {
      // Agregar el archivo
      request.files.add(http.MultipartFile(
        'files[]',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
      ));

      });
      print('Products ${product.toJson()}' );
      // Agregar campos adicionales
      request.fields['name']= product.name;
      request.fields['description']= product.description;
      request.fields['price']= product.price.toString();
      request.fields['id_category']= product.idCategory.toString();

      // Enviar la solicitud
      final response = await request.send();
      print('RESPONSE: ${response.statusCode}');

      // Leer los datos de la respuesta
      final data = json.decode(await response.stream.transform(utf8.decoder).first);   
      // Verificar el estado de la respuesta
      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>>getProductsByCategory(int idCategory) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/categories
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products/category/$idCategory');
      //obteniendo el token
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
      };
      
      final response = await  http.get(url, headers: headers);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        List<Product>categories = Product.fromJsonList(data);
        return Success(categories);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<Product>>update(int id, Product product) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/users/5
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products/$id');
      
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
        };
      String body = json.encode({
        'name':product.name,
        'description':product.description,
        'price':product.price
      });
      print('Request Body: $body');

      final response = await  http.put(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      print('Response: ${response.body}');


      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<Product>>updateWithImage(int id, Product product,List<File> files, List<int>imagesToUpdate) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/products
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products/upload/$id');      
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] =await token;
      for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath(
        'files[]',
        file.path,
        contentType: MediaType('image', 'jpg')
        ));
      }

      print('Products ${product.toJson()}' );
      // Agregar campos adicionales
      request.fields['name']= product.name;
      request.fields['description']= product.description;
      request.fields['price']= product.price.toString();
      request.fields['images_to_update[]']= imagesToUpdate.join(',');//['0', '1']

      // Enviar la solicitud
      final response = await request.send();
      print('RESPONSE: ${response.statusCode}');

      // Leer los datos de la respuesta
      final data = json.decode(await response.stream.transform(utf8.decoder).first);   
      // Verificar el estado de la respuesta
      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

}