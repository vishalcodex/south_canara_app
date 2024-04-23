import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/form_fields.dart';
import '../../../../components/ui/image_input.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/product_controller.dart';

// ignore: must_be_immutable
class ProductEditScreen extends GetView<ProductController> {
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    bool isAdd = Get.arguments?["isAdd"] ?? false;
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Padding(
                      padding: EdgeInsets.all(10.0 * fem),
                      child: MyListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  ImageInput(
                                    callback: (img) {},
                                    child: RoundedContainer(
                                      borderColor: ColorPallete.primary,
                                      radius: 125,
                                      height: 125,
                                      width: 125,
                                      child: Icon(
                                        Icons.photo_outlined,
                                        size: 50,
                                        color: ColorPallete.grey,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      backgroundColor: ColorPallete.primary,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          MyFormField(
                            fieldName: "Product Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product Category",
                            type: InputType.DROP_DOWN,
                            dropDownOptions: ["Food", "Electronics"],
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product Sub Category",
                            type: InputType.DROP_DOWN,
                            dropDownOptions: ["Sub 1", "Sub 2"],
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product Description",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                            maxLines: 3,
                          ),
                          MyFormField(
                            fieldName: "Product Unit",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product Price",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product MOQ",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Product Origin",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Packaging Type",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          SizedBox(
                            height: 5 * fem,
                          ),
                        ],
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
                    Get.back();
                    controller.addUpdateProduct(isAdd);
                  },
                  child: RoundedContainer(
                    radius: 0,
                    color: ColorPallete.theme,
                    child: Padding(
                      padding: EdgeInsets.all(5.0 * fem),
                      child: RoundedContainer(
                        radius: 10,
                        color: ColorPallete.primary,
                        child: Padding(
                          padding: EdgeInsets.all(15.0 * fem),
                          child: Center(
                            child: TextView(
                              text: isAdd ? "Add Product" : "Update Product",
                              color: ColorPallete.theme,
                              fontSize: 14,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
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
