import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/form_fields.dart';
import '../../../../components/ui/image_input.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../../../providers/api_endpoints.dart';
import '../../controllers/product_controller.dart';

// ignore: must_be_immutable
class ProductEditScreen extends GetView<ProductController> {
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    bool isAdd = (controller.selectedProduct.value.id ?? 0) == 0;
    controller.selectedProduct.value.productUnit = "Kgs";
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: TextView(
              text: isAdd ? "Add New Product" : "Update Product",
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
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.all(10.0 * fem),
                        child: Form(
                          key: controller.addProductKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      RoundedContainer(
                                        borderColor: ColorPallete.primary,
                                        radius: 125,
                                        height: 125,
                                        width: 125,
                                        child: RoundedContainer(
                                          clip: Clip.antiAliasWithSaveLayer,
                                          radius: 124,
                                          child: CachedNetworkImage(
                                            imageUrl: Urls.getImageUrl(
                                                controller.selectedProduct.value
                                                        .productImage ??
                                                    ""),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.file(
                                                File(controller.selectedProduct
                                                        .value.productImage ??
                                                    ""),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Icon(
                                                    Icons.photo_outlined,
                                                    size: 50,
                                                    color: ColorPallete.grey,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: ImageInput(
                                          callback: (img) {
                                            controller.selectedProduct.value
                                                .productImage = img;
                                            controller.selectedProduct
                                                .refresh();
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor:
                                                ColorPallete.primary,
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              color: ColorPallete.theme,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              Row(
                                children: [
                                  const TextView(
                                    text: "Product Status ",
                                    fontSize: 14,
                                  ),
                                  TextView(
                                    text:
                                        "(${(controller.selectedProduct.value.status ?? true) ? "Active" : "Inactive"})",
                                    fontSize: 14,
                                    color: ColorPallete.grey,
                                  ),
                                  const Spacer(),
                                  CupertinoSwitch(
                                    value: controller
                                            .selectedProduct.value.status ??
                                        true,
                                    onChanged: (value) {
                                      controller.selectedProduct.value.status =
                                          !(controller.selectedProduct.value
                                                  .status ??
                                              true);
                                      controller.selectedProduct.refresh();
                                    },
                                    activeColor: ColorPallete.primary,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.productName,
                                fieldName: "Product Name",
                                type: InputType.TEXT,
                                required: true,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.selectedProduct.value.productName =
                                      value;
                                },
                              ),
                              MyFormField(
                                initialValue: controller.categories
                                        .where((p0) =>
                                            p0.id ==
                                            controller.selectedProduct.value
                                                .categoryId)
                                        .isEmpty
                                    ? null
                                    : controller.categories
                                        .where((p0) =>
                                            p0.id ==
                                            controller.selectedProduct.value
                                                .categoryId)
                                        .first
                                        .name,
                                fieldName: "Product Category",
                                type: InputType.DROP_DOWN,
                                required: true,
                                dropDownOptions: controller.categories
                                    .map((element) => element.name)
                                    .toList(),
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.onCategorySelected(value);
                                },
                              ),
                              controller.subcategories.isEmpty
                                  ? const SizedBox.shrink()
                                  : MyFormField(
                                      initialValue: controller.subcategories
                                              .where((p0) =>
                                                  p0.id ==
                                                  controller.selectedProduct
                                                      .value.subcategoryId)
                                              .isEmpty
                                          ? null
                                          : controller.subcategories
                                              .where((p0) =>
                                                  p0.id ==
                                                  controller.selectedProduct
                                                      .value.subcategoryId)
                                              .first
                                              .name,
                                      fieldName: "Product Sub Category",
                                      type: InputType.DROP_DOWN,
                                      dropDownOptions: controller.subcategories
                                          .map((element) => element.name)
                                          .toList(),
                                      keyboard: TextInputType.text,
                                      onChanged: (value) {
                                        controller.onSubCategorySelected(value);
                                      },
                                    ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.productDescription,
                                fieldName: "Product Description",
                                required: true,
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.selectedProduct.value
                                      .productDescription = value;
                                },
                                maxLines: 3,
                              ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.productUnit,
                                fieldName: "Product unit",
                                required: true,
                                type: InputType.DROP_DOWN,
                                keyboard: TextInputType.number,
                                dropDownOptions: const ["Kgs"],
                                onChanged: (value) {
                                  controller.selectedProduct.value.productUnit =
                                      value;
                                },
                              ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.productPrice,
                                fieldName: "Product Price (Exclusive of GST)",
                                type: InputType.TEXT,
                                required: true,
                                keyboard: TextInputType.number,
                                onChanged: (value) {
                                  controller.selectedProduct.value
                                      .productPrice = value;
                                },
                              ),
                              MyFormField(
                                initialValue: (controller
                                            .selectedProduct.value.productMoq ??
                                        "")
                                    .toString(),
                                fieldName:
                                    "Product MOQ (Minimum Order Quantity)",
                                type: InputType.TEXT,
                                keyboard: TextInputType.number,
                                length: 5,
                                required: true,
                                onChanged: (value) {
                                  controller.selectedProduct.value.productMoq =
                                      int.parse(value);
                                },
                                validator: (value) {
                                  return (value ?? "") == ""
                                      ? "Product MOQ is Required"
                                      : double.parse(value!) < 20000
                                          ? null
                                          : "Product MOQ should be less than 20,000";
                                },
                              ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.productOrigin,
                                fieldName: "Product Origin",
                                required: true,
                                type: InputType.DROP_DOWN,
                                dropDownOptions: const [
                                  "Benin",
                                  "Tanzania",
                                  "Indian",
                                  "Guinea-Bissau",
                                  "Côte d’Ivoire",
                                  "Vietnam",
                                  "Saudi",
                                  "Iran"
                                ],
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.selectedProduct.value
                                      .productOrigin = value;
                                },
                              ),
                              MyFormField(
                                initialValue: controller
                                    .selectedProduct.value.packagingType,
                                fieldName: "Packaging Type",
                                type: InputType.DROP_DOWN,
                                required: true,
                                dropDownOptions: const [
                                  "10Kgs Tin",
                                  "20kgs Box",
                                  "250grams packing",
                                  "25kgs",
                                  "500 grams packing"
                                ],
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.selectedProduct.value
                                      .packagingType = value;
                                },
                              ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: ColorPallete.grey.withOpacity(0.5),
                  ),
                ]),
                child: InkWell(
                  onTap: () {
                    if (!controller.isLoading.value) {
                      controller.addUpdateProduct(isAdd);
                    }
                  },
                  child: RoundedContainer(
                    radius: 0,
                    color: ColorPallete.theme,
                    child: Padding(
                      padding: EdgeInsets.all(5.0 * fem),
                      child: RoundedContainer(
                          radius: 10,
                          height: 45,
                          color: ColorPallete.primary,
                          child: Obx(
                            () => controller.isLoading.value
                                ? const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(15.0 * fem),
                                    child: Center(
                                      child: TextView(
                                        text: isAdd
                                            ? "Add Product"
                                            : "Update Product",
                                        color: ColorPallete.theme,
                                        fontSize: 14,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
