import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_social_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_button.dart';
import 'package:ecommerce/view/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    /*boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0))
                    ]*/),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CustomText(
                        text: 'Sign Up',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        text: 'Name',
                        hint: 'Alighazi',
                        onSave: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('Error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        text: 'Email',
                        hint: 'Alighazi@gmail.com',
                        onSave: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('Error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        text: 'Password',
                        hint: '***********',
                        onSave: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('Error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          color: primaryColor,
                          text: 'SIGN UP',
                          onPressed: () {
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              controller.CreateAccountWithEmailAndPassword();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
