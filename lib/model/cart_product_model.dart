import 'dart:ui';

import '../helper/extension.dart';

class CartProductModel {
  late String name, image, price,productId;
  late int quantity;

  CartProductModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      required this.productId});

/*  now the data came in shape of json[map] so i will deserialize it
  we save the data which came by using its key map['name']*/
  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    //for constructing a new User instance from a map structure.
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  toJson() {
    // converts a User instance into a map.
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
