import 'dart:ui';

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/auth/regitser_view.dart';
import 'package:ecommerce/view/widgets/custom_social_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_button.dart';
import 'package:ecommerce/view/widgets/custom_text_from_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginView extends GetWidget<AuthViewModel> {
   LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(

        padding: const EdgeInsets.only(
          top: 50,
          right: 10,
          left: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                height: 420,
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6), color: Colors.white,
                    /*boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0)
                )]*/),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const CustomText(
                            text: 'Welcome',
                            fontSize: 30,
                            color: Colors.black,
                          ),
                           GestureDetector(
                             onTap: (){
                               Get.to(RegisterView());
                             },
                             child:const CustomText(
                                text: 'Sign Up',
                                fontSize: 16,
                                color: primaryColor,
                              ),
                           ),

                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const CustomText(
                        alignment: Alignment.topLeft,
                        text: 'Sign in to continue',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(

                        text: 'Email',
                        hint: 'Alighazi@gmail.com',
                        onSave: (value) {
                          controller.email=value!;
                        },
                        validator: (value) {
                          if(value==null){
                            print('Error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        text: 'Password',
                        hint: '***********',
                        onSave: (value) {
                          controller.password=value!;
                        },
                        validator: (value) {
                          if(value==null){
                            print('Error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Forgot Password?',
                        fontSize: 14,
                        alignment: Alignment.topRight,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextButton(
                        color: primaryColor,
                          text: 'SIGN IN',
                          onPressed: () {
                            _formKey.currentState?.save();
                            if(_formKey.currentState!.validate()) {
                              controller.SignInWithEmailAndPassword();
                            }

                          }),

                    ],

                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const CustomText(
                text: '-OR-',
                fontSize: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSocialButton(
                text: 'Sign in with Google',
                imageName: 'assets/images/google.png',
                onPress: () {
                  controller.googleSignInMethod();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSocialButton(
                text: 'Sign in with Facebook',
                imageName: 'assets/images/facebook.png',
                onPress: () {
                  controller.facebookSignInMethod();

                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
