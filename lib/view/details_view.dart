import 'package:ecommerce/constant.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_view_model.dart';
import '../model/cart_product_model.dart';
import '../model/product_model.dart';

import '../helper/bindings.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.model}) : super(key: key);
  final ProductModel model; //the data in each model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                height: 270,
                width: double.infinity,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          fontSize: 26,
                          alignment: Alignment.topLeft,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CustomText(
                                    text: 'Size',
                                  ),
                                  CustomText(
                                    text: model.sized,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CustomText(
                                    text: 'Color',
                                  ),
                                  Container(
                                    width: 35,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                        color: model.color),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomText(
                          text: 'Details',
                          fontSize: 20,
                          alignment: Alignment.topLeft,
                        ),
                        const SizedBox(height: 15),
                        CustomText(
                          text: model.description,
                          fontSize: 18,
                          maxLine: 10,
                          height: 2.5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: "PRICE",
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: ' \$' + model.price,
                        color: primaryColor,
                        fontSize: 22,
                      )
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.put(CartViewModel()),
                    builder: (controller) => Container(
                      padding: EdgeInsets.all(20),
                      height: 100,
                      width: 180,
                      child: CustomTextButton(
                          text: 'ADD',
                          onPressed: () {
                            controller.addProduct(CartProductModel(
                              name: model.name,
                              image: model.image,
                              quantity: 1,
                              price: model.price,
                              productId: model.productId
                            ));
                          },
                          color: primaryColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
