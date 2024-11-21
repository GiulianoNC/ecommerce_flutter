import 'dart:convert';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;


class MercadoPagoService{

  Future<String>token;

  MercadoPagoService(this.token);

    Future<Resource<List<MercadoPagoIdentificationType>>>getIdentificationTypes() async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/categories
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/mercadopago/identification_types');
      //obteniendo el token
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
        };
      
      final response = await  http.get(url, headers: headers);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        List<MercadoPagoIdentificationType>identificationType = MercadoPagoIdentificationType.fromJsonList(data);
        return Success(identificationType);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }


}