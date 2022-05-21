import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        image: DecorationImage(
                            image: controller.userModel == null
                                ? const AssetImage('assets/images/google.png')
                                : controller.userModel?.pic == 'default'
                                    ? AssetImage('assets/images/google.png')
                                        as ImageProvider
                                    : NetworkImage(controller.userModel!.pic)),
                      ),
                    ),
                    /*TextButton(onPressed: (){
                       print(controller.userModel!.name);
                      *//*controller.signOut();
                      Get.offAll(LoginView());*//*
                    }, child: Text("Sign out")),
                    Column(
                      children: [
                        CustomText(
                          text: controller.userModel!.name,
                          color: Colors.black,
                          fontSize: 32,
                        ),
                        CustomText(
                          text:  controller.userModel!.email,
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ],
                    )*/
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
