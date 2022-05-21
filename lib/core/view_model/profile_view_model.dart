import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';

class ProfileViewModel extends GetxController {


  UserModel? _userModel;
  UserModel? get userModel => _userModel;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCurrentUser();
    print(userModel?.name);
    //once change happen on the auth make update to the value which comes from the auth
  }

  final LocalStorageData localStorageData = Get.find();


  void getCurrentUser() async {
    await localStorageData.getUser.then((value) {
      _userModel = value!;
      print(userModel?.pic);


    });
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }


}