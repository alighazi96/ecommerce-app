
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/controller_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/bindings.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: ControllView(),
      ),
      theme: ThemeData(
        fontFamily:'SourceSans'
      ),
    );
  }
}
