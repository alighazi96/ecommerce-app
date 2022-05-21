import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../service/home_service.dart';


//here i got the data and store it and send it to the UI
class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      //.get mean give all the data which saved in this ref
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<
            dynamic,
            dynamic>)); //now we will save the values which came to us and save it to our list
        _loading.value =
            false; //once we got the value from firebase make it false
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
     HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value=false;
        
      }
      print(_productModel.length);
      update();
    });
  }
}
