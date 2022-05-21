

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/home_view_model.dart';



class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   final List<String> names = ['men', 'A', 'A', 'A', 'A'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init:HomeViewModel(),
      builder:(controller)=>controller.loading.value
          ? const Center(child: CircularProgressIndicator()):
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  alignment: Alignment.topLeft,
                  text: 'Categories',
                ),
                const SizedBox(
                  height: 30,
                ),
                _listViewCategory(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'Best Selling',
                      fontSize: 18,
                    ),
                    CustomText(
                      text: 'See all',
                      fontSize: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _listViewProduct(),
              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder:((controller) =>
      SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        controller.categoryModel[index].image,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      )),
    );
  }



  _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder:((controller) =>  SizedBox(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(DetailsScreen(model: controller.productModel[index],));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 220,
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.fill,
                            ))),
                    const SizedBox(height: 20),
                     CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(height: 5),
                     CustomText(text: controller.productModel[index].description.toString(),maxLine: 2,),
                    const SizedBox(height: 10),
                     CustomText(
                      text: controller.productModel[index].price.toString()+" \$",
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                    //Text(controller.productModel[0].description,maxLines: 2,)


                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),

        ),
      )
      ));
  }




}
