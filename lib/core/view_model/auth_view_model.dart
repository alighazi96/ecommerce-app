import 'dart:convert';
import 'dart:ui';

import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/controller_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../service/firestore_user.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);
  final FacebookLogin _facebookLogin = FacebookLogin();

  late String email, password, name;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    //once change happen on the auth make update to the value which comes from the auth
  }

  void googleSignInMethod() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential).then((userdata) {
      saveUser(userdata);
      Get.offAll(HomeView());
    });
    //once i make sign in with credential the value in auth changes with the stream
    //once  click on any sign in the auth change
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    final accessToken = result.accessToken!.token;
    //now i got the token i will use it to get the credential in the firebase
    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);

      await _auth.signInWithCredential(faceCredential).then((userdata) async {
        saveUser(userdata);
        Get.offAll(HomeView());
      });
    }
  }

  void SignInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async{
            await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
              setUser(UserModel.fromJson(value.data() as Map));
            });
      });
      Get.offAll(HomeView());
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar('Error login account', e.message.toString(),
          colorText: const Color.fromRGBO(0, 0, 0, 1),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //with this method i will sent all the data to the usermodel then to the firestore
  void CreateAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userdata) async {
        /* after finishing the future the userdata holds the data which i add it
        on the app once i use this method we make instance from the usermodel*/
        saveUser(userdata);
      });

      Get.offAll(ControllView());
    }on FirebaseException catch  (e) {
      print(e.message);
      Get.snackbar('Error login account', e.message.toString(),
          colorText: const Color.fromRGBO(0, 0, 0, 1),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential userdata) async {
    /*when is use saveUser i will put the data in the setUser*/
    UserModel userModel = UserModel(
      userId: userdata.user!.uid,
      email: userdata.user!.email!,
      name: name == null ? userdata.user!.displayName! : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}

/*Future<Future<UserCredential>> facebookSignInMethod()async{
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final AuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }*/
