import 'dart:convert';

class Address {
  int? id;
  String address;
  String neighborhood;
  int idUser;

  Address({
    this.id,
    required this.address,
    required this.neighborhood,
    required this.idUser,
  });

  // Método para convertir un JSON en un objeto Address
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        neighborhood: json["neighborhood"],
        idUser: json["id_user"],
      );

  // Método para convertir una lista de JSONs en una lista de objetos Address
  static List<Address> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Address.fromJson(item)).toList();
  }

  // Método para convertir un objeto Address a un JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "neighborhood": neighborhood,
        "id_user": idUser,
      };

  // Métodos para convertir un objeto Address a String y viceversa (opcional)
  static Address clientFromJson(String str) => Address.fromJson(json.decode(str));
  static String clientToJson(Address data) => json.encode(data.toJson());
}
