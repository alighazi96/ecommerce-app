import 'dart:convert';

import 'package:ecommerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class LocalStorageData extends GetxController {

  Future<UserModel?> get getUser async{
    try{
      UserModel userModel= await _getUserData();
      if(userModel == null){
        return null;
      }
      return userModel;

    }catch(e){
      printError();
      return null;
    }
  }

  _getUserData()async{
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var value=prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  /*this method set the data of the user in the sharedPreferance */
  setUser(UserModel userModel) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); //get instance from the sharePref

    await prefs.setString(
        CACHED_USER_DATA, json.encode(userModel.toJson())); //the json came in map and value i will convert it to String
  }

  void deleteUser()async{
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    await prefs.clear();    //to clear the data from the sharedprefs in case we sign out

  }


}
