import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/bindings.dart';


class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) =>
                  Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 140,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 140,
                                    child: Image.network(
                                      controller.cartProductModel[index].image,
                                      fit: BoxFit.fill,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      CustomText(
                                        text: controller.cartProductModel[index]
                                            .name,
                                        fontSize: 24,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomText(
                                        fontSize: 22,
                                        color: primaryColor,
                                        text: '\$ ${controller
                                            .cartProductModel[index].price
                                            .toString()}',
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        width: 120,
                                        height: 50,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            GestureDetector(onTap: () {
                                              controller.increaseQuantity(
                                                  index);
                                            },
                                                child: const Icon(Icons.add,
                                                    color: Colors.black)),
                                            const SizedBox(width: 20),
                                            CustomText(text: controller
                                                .cartProductModel[index]
                                                .quantity.toString()),
                                            const SizedBox(width: 20),
                                            Container(
                                                padding:
                                                const EdgeInsets.only(
                                                    bottom: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.minimize,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "Total",
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder: (controller) =>
                          CustomText(
                            text: ' \$${controller.totalPrice}',
                            color: primaryColor,
                            fontSize: 20,
                          ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: 110,
                      height: 50,
                      child: CustomTextButton(

                          text: 'CHECKOUT',
                          onPressed: () {},
                          color: primaryColor)),
                )
              ],
            ),
          ),


        ],
      ),

    );
  }
}
