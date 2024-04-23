import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/product_controller.dart';

// ignore: must_be_immutable
class MyProductsScreen extends GetView<ProductController> {
  const MyProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "My Products",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  children: [
                    Obx(() => controller.products.isEmpty
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10 * fem),
                              child: MyListView(
                                children: [1, 2, 3, 4].map((e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0 * fem),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PRODUCT_DETAILS,
                                            arguments: {
                                              "isAdd": false,
                                              "product": {}
                                            });
                                      },
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 150,
                                        color:
                                            ColorPallete.grey.withOpacity(0.5),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0 * fem),
                                          child: Row(
                                            children: [
                                              RoundedContainer(
                                                radius: 10,
                                                color: ColorPallete.grey,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                              ),
                                              SizedBox(
                                                width: 10 * fem,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    //Product Name
                                                    Row(
                                                      children: [
                                                        RoundedContainer(
                                                          radius: 5,
                                                          height: 10,
                                                          width: 100,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    //Product Categgory
                                                    Row(
                                                      children: [
                                                        RoundedContainer(
                                                          radius: 5,
                                                          height: 10,
                                                          width: 125,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    //Product Unit
                                                    Row(
                                                      children: [
                                                        RoundedContainer(
                                                          radius: 5,
                                                          height: 10,
                                                          width: 75,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    //Product Price
                                                    Row(
                                                      children: [
                                                        RoundedContainer(
                                                          radius: 5,
                                                          height: 10,
                                                          width: 100,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    //Product MOQ
                                                    Row(
                                                      children: [
                                                        RoundedContainer(
                                                          radius: 5,
                                                          height: 10,
                                                          width: 85,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.75),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(10 * fem),
                            child: MyListView(
                              children: [1, 2, 3].map((e) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 5.0 * fem),
                                  child: RoundedContainer(
                                    radius: 10,
                                    height: 150,
                                    color: ColorPallete.grey.withOpacity(0.5),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0 * fem),
                                      child: Row(
                                        children: [
                                          RoundedContainer(
                                            radius: 10,
                                            color: ColorPallete.grey,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                          ),
                                          SizedBox(
                                            width: 10 * fem,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                //Product Name
                                                Row(
                                                  children: [
                                                    RoundedContainer(
                                                      radius: 5,
                                                      height: 10,
                                                      width: 100,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.75),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                //Product Categgory
                                                Row(
                                                  children: [
                                                    RoundedContainer(
                                                      radius: 5,
                                                      height: 10,
                                                      width: 125,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.75),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                //Product Unit
                                                Row(
                                                  children: [
                                                    RoundedContainer(
                                                      radius: 5,
                                                      height: 10,
                                                      width: 75,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.75),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                //Product Price
                                                Row(
                                                  children: [
                                                    RoundedContainer(
                                                      radius: 5,
                                                      height: 10,
                                                      width: 100,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.75),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                //Product MOQ
                                                Row(
                                                  children: [
                                                    RoundedContainer(
                                                      radius: 5,
                                                      height: 10,
                                                      width: 85,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.75),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ))
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: InkWell(
            onTap: () {
              Get.toNamed(Routes.PRODUCT_DETAILS,
                  arguments: {"isAdd": true, "product": {}});
            },
            child: CircleAvatar(
              radius: 20 * fem,
              backgroundColor: ColorPallete.primary,
              child: Icon(
                Icons.add,
                color: ColorPallete.theme,
                size: 30 * fem,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
