import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:south_canara/app/providers/api_endpoints.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../../../models/product_model.dart';
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
                child: RefreshIndicator(
                  onRefresh: () {
                    controller.fetchProducts();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(() => controller.isLoading.value
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(10 * fem),
                                child: MyListView(
                                  children: [1, 2, 3].map((e) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0 * fem),
                                      child: InkWell(
                                        onTap: () {},
                                        child: RoundedContainer(
                                          radius: 10,
                                          height: 150 * fem,
                                          color: ColorPallete.grey
                                              .withOpacity(0.5),
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
                                                      4,
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
                          : controller.products.isEmpty
                              ? const SizedBox(
                                  height: 250,
                                  child: Center(
                                    child: TextView(
                                      text:
                                          "No Products Found !\n\nPlease add Products",
                                      color: ColorPallete.grey,
                                      fontSize: 18,
                                      alignment: TextAlign.center,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: MyListView(
                                    children: controller.products.map((e) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0 * fem),
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color: ColorPallete.grey
                                                  .withOpacity(0.25),
                                              blurRadius: 15,
                                              spreadRadius: 5,
                                            )
                                          ]),
                                          child: InkWell(
                                              onTap: () {
                                                controller.onProductSelected(e);
                                              },
                                              child: _getProductWidget(
                                                  fem, context, e)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: InkWell(
            onTap: () {
              controller.selectedProduct.value = Product();
              controller.fetchCategories();
              Get.toNamed(Routes.PRODUCT_DETAILS);
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

  _getProductWidget(
    double fem,
    BuildContext context,
    Product product,
  ) {
    return RoundedContainer(
      radius: 10,
      height: 150 * fem,
      color: ColorPallete.theme,
      child: Padding(
        padding: EdgeInsets.all(10.0 * fem),
        child: Row(
          children: [
            RoundedContainer(
              radius: 10,
              clip: Clip.antiAliasWithSaveLayer,
              borderColor: ColorPallete.primary,
              color: ColorPallete.theme,
              width: MediaQuery.of(context).size.width / 4,
              child: Padding(
                padding: EdgeInsets.all(0.5 * fem),
                child: Column(
                  children: [
                    Expanded(
                        child: RoundedContainer(
                      radius: 10,
                      clip: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: Urls.getImageUrl(product.productImage ?? ""),
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_outlined,
                            color: ColorPallete.primary,
                            size: 50,
                          );
                        },
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10 * fem,
            ),
            Expanded(
              child: MyListView(
                children: [
                  //Product Name
                  // TextView(
                  //   text: product.productName.toString(),
                  //   color: ColorPallete.primary,
                  //   fontSize: 14,
                  //   weight: FontWeight.w700,
                  // ),
                  _getEntry("Name", product.productName.toString()),
                  _getEntry(
                      "Description", product.productDescription.toString()),
                  _getEntry("Price", product.productPrice.toString()),
                  _getEntry("Origin", product.productOrigin.toString()),
                  _getEntry("MOQ", product.productMoq.toString()),
                  _getEntry("Unit", "Kgs"),
                  _getEntry("Packaging", product.packagingType.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getEntry(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.50),
      child: Row(
        children: [
          TextView(
            text: title,
            color: ColorPallete.primary,
            fontSize: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextView(
              text: ":",
              color: ColorPallete.primary,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: TextView(
              text: value,
              color: ColorPallete.primary,
              fontSize: 14,
              weight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
