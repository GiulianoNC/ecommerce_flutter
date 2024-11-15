import 'dart:convert';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class AddressService {

  Future<String> token;

  AddressService(this.token);

  Future<Resource<Address>>create(Address address) async {
    try {
      print('Address${address.toJson()}');
      //PETICION A LA RUTA http://192.168.0.21:3000/address
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/address');
      
      Map<String, String> headers ={
        "Content-Type": "application/json",
        "Authorization":await token
      };
      String body = json.encode(address.toJson());

      print('Request Body: $body');

      final response = await  http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      print('Response: ${response.body}');


      if(response.statusCode == 200 || response.statusCode == 201){//EXITOSA
        Address addressResponse = Address.fromJson(data);
        return Success(addressResponse);
      }else{
        return Error(listToString(data['message']));//ERROR
      }
    } catch (e) {
      print('Error $e' );
      return Error(e.toString());
    }
  }

  Future<Resource<List<Address>>> getUserAddress(int iduser) async {
    try {
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/address/user$iduser');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Convertir la respuesta en una lista de direcciones usando fromJsonList
        List<Address> addressList = Address.fromJsonList(data);
        return Success(addressList);
      } else {
        return Error(listToString(data['message'])); // ERROR
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

}
