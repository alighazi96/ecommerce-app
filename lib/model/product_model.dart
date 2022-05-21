import 'dart:ui';

import '../helper/extension.dart';

class ProductModel {
  late String productId ,name, image, description, sized, price;
  late Color color;

  ProductModel(this.name, this.image, this.description, this.color, this.sized,
      this.price,this.productId);

/*  now the data came in shape of json[map] so i will deserialize it
  we save the data which came by using its key map['name']*/
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    //for constructing a new User instance from a map structure.
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    // converts a User instance into a map.
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
