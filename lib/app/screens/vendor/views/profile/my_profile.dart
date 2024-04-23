import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/form_fields.dart';
import '../../../../components/ui/image_input.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/vendor_controller.dart';

// ignore: must_be_immutable
class ProfileEditScreen extends GetView<VendorController> {
  const ProfileEditScreen({Key? key}) : super(key: key);

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
              text: "My Profile",
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
                      child: Column(
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
                            fieldName: "Company Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          //ADDRESS
                          MyFormField(
                            fieldName: "Address",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                            maxLines: 3,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyFormField(
                                  fieldName: "City",
                                  type: InputType.DROP_DOWN,
                                  keyboard: TextInputType.number,
                                  dropDownOptions: ["City 1", "City 2"],
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: MyFormField(
                                  fieldName: "State",
                                  type: InputType.DROP_DOWN,
                                  keyboard: TextInputType.number,
                                  dropDownOptions: ["State 1", "State 2"],
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          MyFormField(
                            fieldName: "Country",
                            type: InputType.DROP_DOWN,
                            keyboard: TextInputType.number,
                            dropDownOptions: ["Country 1", "Country 2"],
                            onChanged: (value) {},
                          ),
                          //GST
                          MyFormField(
                            fieldName: "GST Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          Obx(
                            () => ImageInput(
                              callback: (img) {
                                controller.gstImg.value = img;
                                controller.gstImg.refresh();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5 * fem),
                                child: controller.gstImg.value != ""
                                    ? RoundedContainer(
                                        radius: 10,
                                        height: 150,
                                        width: double.infinity,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        child: Image.file(
                                          File(controller.gstImg.value),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : RoundedContainer(
                                        radius: 5,
                                        color:
                                            ColorPallete.grey.withOpacity(0.1),
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0 * fem),
                                          child: const Row(
                                            children: [
                                              TextView(
                                                text: "Upload Copy Of GST",
                                                color: ColorPallete.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          //CONTACT
                          MyFormField(
                            fieldName: "Contact Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.phone,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Alternate Contact Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.phone,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Nature Of Business",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Leagal Status Of Firm",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Director's Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Email Id",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          //BANK
                          MyFormField(
                            fieldName: "Bank Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Bank Account Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "IFSC Code",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Beneficiary Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.text,
                            onChanged: (value) {},
                          ),
                          MyFormField(
                            fieldName: "Year Of Establishment",
                            type: InputType.TEXT,
                            keyboard: TextInputType.number,
                            onChanged: (value) {},
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
                          child: const Center(
                            child: TextView(
                              text: "Save",
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
