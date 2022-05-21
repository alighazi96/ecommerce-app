import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';
import '../service/database/cart_data_base_helper.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;

  double _totalPrice = 0;

  var dbhelper = CartDatabaseHelper.db;


  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbhelper.getAllProduct();
    //the list which came from the getAllproduct i will save it in _cartProductModel
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbhelper = CartDatabaseHelper.db;
    await dbhelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
  }

  increaseQuantity(int index)async {

      _cartProductModel[index].quantity++;
      _totalPrice += (double.parse(cartProductModel[index].price));
      await dbhelper.updateProduct(_cartProductModel[index]);

      update();


  }
  decreaseQuantity(int index)async {

      _cartProductModel[index].quantity--;
      _totalPrice -= (double.parse(cartProductModel[index].price));
      await dbhelper.updateProduct(_cartProductModel[index]);
      update();

  }
}
