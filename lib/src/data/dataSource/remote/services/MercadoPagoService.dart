import 'dart:convert';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;


class MercadoPagoService{

  Future<String>token;

  MercadoPagoService(this.token);

  Future<Resource<List<MercadoPagoIdentificationType>>>getIdentificationTypes() async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/
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

  Future<Resource<MercadoPagoCardTokenResponse>>createCardToken(MercadoPagoCardTokenBody mercadoPagoCardTokenBody) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/mercadopago/card_token');
      //obteniendo el token
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
        };
      String body = json.encode(mercadoPagoCardTokenBody.toJson());
      final response = await  http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
       MercadoPagoCardTokenResponse mercadoPagoCardTokenResponse = MercadoPagoCardTokenResponse.fromJson(data);
        return Success(mercadoPagoCardTokenResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<MercadoPagoInstallments>> getInstallments(String firstSixDigits, String amount) async {
    try {
      //PETICION A LA RUTA http://192.168.0.21:3000/
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/mercadopago/installments/$firstSixDigits/$amount');
      //obteniendo el token
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
        };
      
      final response = await  http.get(url, headers: headers);
      final data = jsonDecode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        MercadoPagoInstallments mercadoPagoInstallments = MercadoPagoInstallments.fromJson(data);
        return Success(mercadoPagoInstallments);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
     }catch (e) {
      print('Error $e' );
      return Error(e.toString());
      }
    }

}