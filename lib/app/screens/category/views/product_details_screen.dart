import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../controllers/category_controller.dart';
import '../widgets/enquiry_alert.dart';

// ignore: must_be_immutable
class ProductSupplierDetailsScreen extends GetView<CategoryController> {
  const ProductSupplierDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Product Details",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MyListView(
                        children: [
                          InkWell(
                            onTap: () {
                              // log(Urls.getImageUrl(controller
                              //         .selectedSupplier.value.productImage ??
                              //     ""));
                              if (controller.selectedSupplier.value
                                          .productImage !=
                                      null ||
                                  controller.selectedSupplier.value
                                          .productImage !=
                                      "") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Scaffold(
                                        backgroundColor:
                                            Colors.transparent.withOpacity(0.5),
                                        body: SafeArea(
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl: Urls.getImageUrl(
                                                            controller
                                                                    .selectedSupplier
                                                                    .value
                                                                    .productImage ??
                                                                ""),
                                                        fit: BoxFit.fill,
                                                        errorWidget: (context,
                                                            url, error) {
                                                          return const Icon(
                                                            Icons
                                                                .image_outlined,
                                                            color: ColorPallete
                                                                .theme,
                                                            size: 50,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          15.0 * fem),
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 25 * fem,
                                                        color:
                                                            ColorPallete.theme,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  backgroundColor: ColorPallete.primary,
                                  duration: Duration(seconds: 3),
                                  message: "No Image Present !",
                                ));
                              }
                            },
                            child: RoundedContainer(
                              radius: 10 * fem,
                              clip: Clip.antiAliasWithSaveLayer,
                              borderColor: ColorPallete.primary,
                              color: ColorPallete.grey.withOpacity(0.5),
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(1.0 * fem),
                                child: RoundedContainer(
                                  radius: 10 * fem,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  child: CachedNetworkImage(
                                    imageUrl: Urls.getImageUrl(controller
                                            .selectedSupplier
                                            .value
                                            .productImage ??
                                        ""),
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) {
                                      return const Icon(
                                        Icons.image_outlined,
                                        color: ColorPallete.theme,
                                        size: 50,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 10 * fem,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 5),
                                  color: ColorPallete.grey.withOpacity(0.2),
                                )
                              ]),
                              child: RoundedContainer(
                                radius: 10 * fem,
                                color: ColorPallete.theme,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: MyListView(
                                    children: [
                                      TextView(
                                        text: controller
                                            .selectedSupplier.value.productName
                                            .toString(),
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text:
                                            "Supplier : ${controller.selectedSupplier.value.vendorDetails!.companyName}",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          EntryWidget(
                            title: "Product Description",
                            value: controller
                                .selectedSupplier.value.productDescription
                                .toString(),
                          ),
                          EntryWidget(
                            title: "Product Category",
                            value: controller
                                .selectedSupplier.value.categoryName
                                .toString(),
                          ),
                          EntryWidget(
                            title: "Product Sub Category",
                            value: controller
                                .selectedSupplier.value.subcategoryName
                                .toString(),
                          ),
                          EntryWidget(
                            title: "Minimum Order Quantity",
                            value:
                                "${controller.selectedSupplier.value.productMoq}",
                          ),
                          const EntryWidget(
                            title: "Product Unit",
                            value: "Kgs",
                          ),
                          EntryWidget(
                            title: "Product Price",
                            value:
                                "₹${controller.selectedSupplier.value.productPrice}/-",
                          ),
                          EntryWidget(
                            title: "Product Origin",
                            value:
                                "${controller.selectedSupplier.value.productOrigin}",
                          ),
                          EntryWidget(
                            title: "Product Packaging",
                            value:
                                "${controller.selectedSupplier.value.packagingType}",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10 * fem),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SUPPLIER_DETAILS);
                        },
                        child: RoundedContainer(
                          radius: 10 * fem,
                          height: 40 * fem,
                          color: ColorPallete.theme,
                          borderColor: ColorPallete.primary,
                          child: const Center(
                            child: TextView(
                              text: "View Seller Profile",
                              color: ColorPallete.primary,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return const EnquiryDialog();
                            },
                          );
                        },
                        child: RoundedContainer(
                          radius: 10 * fem,
                          height: 40 * fem,
                          color: ColorPallete.primary,
                          child: const Center(
                            child: TextView(
                              text: "Place an Enquiry",
                              color: ColorPallete.theme,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10 * fem,
            spreadRadius: 5,
            offset: const Offset(0, 5),
            color: ColorPallete.grey.withOpacity(0.2),
          )
        ]),
        child: RoundedContainer(
          radius: 10 * fem,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(10 * fem),
            child: MyListView(
              children: [
                TextView(
                  text: title,
                  color: ColorPallete.secondary,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextView(
                  text: value ?? "N/A",
                  color: ColorPallete.secondary,
                  fontSize: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
