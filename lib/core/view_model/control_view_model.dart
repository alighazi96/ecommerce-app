import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:ecommerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//control the navigation
class ControlViewModel extends GetxController{
  int _navigatorValue=0;

  get navigatorValue => _navigatorValue;
   Widget _currentScreen =  HomeView();
  get currentScreen => _currentScreen;


  void ChangeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0:{
        _currentScreen=HomeView();
        break;
      }
      case 1:{
        _currentScreen=CartView();
        break;
      }
      case 2:{
        _currentScreen = ProfileView();
        break;
      }
    }
    update();
  }
}