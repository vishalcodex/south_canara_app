import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/business_up_controller.dart';
import '../widgets/form_fields.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class BusinessDetailFormScreen extends GetView<BusinessController> {
  const BusinessDetailFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Business Detail Form",
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                      child: Form(
                        key: controller.businessDetailsFormKey,
                        child: MyListView(
                          children: [
                            SizedBox(
                              height: 20 * fem,
                            ),
                            //Logo
                            ImageInput(
                              callback: (img) {
                                controller.image.value = img;
                                controller.businessDetails["image"] = img;
                                controller.image.refresh();
                              },
                              child: Center(
                                child: RoundedContainer(
                                  radius: 0,
                                  height: 100,
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      RoundedContainer(
                                        radius: 50,
                                        borderColor: ColorPallete.primary,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        width: double.infinity,
                                        child: controller
                                                    .businessDetails["image"] ==
                                                null
                                            ? const Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  size: 50,
                                                  color: ColorPallete.primary,
                                                ),
                                              )
                                            : Image.file(
                                                File(controller.image.value),
                                                fit: BoxFit.fill,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.network(
                                                    controller.businessDetails[
                                                        "image"],
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Icon(
                                                          Icons.person_outline);
                                                    },
                                                  );
                                                },
                                              ),
                                      ),
                                      const Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Center(
                                          child: CircleAvatar(
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
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            //Business Name
                            MyFormField(
                              initialValue:
                                  controller.businessDetails["busniess_name"],
                              fieldName: "Business Name",
                              type: InputType.TEXT,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.businessDetails["busniess_name"] =
                                    value;
                              },
                              required: true,
                            ),
                            //About Company
                            MyFormField(
                              initialValue:
                                  controller.businessDetails["about_company"],
                              fieldName: "About Company",
                              type: InputType.TEXT,
                              keyboard: TextInputType.name,
                              maxLines: 5,
                              onChanged: (value) {
                                controller.businessDetails["about_company"] =
                                    value;
                              },
                              required: true,
                            ),
                            //Introduction / Facts
                            MyFormField(
                              initialValue:
                                  controller.businessDetails["intro_facts"],
                              fieldName: "Introduction / Facts",
                              type: InputType.TEXT,
                              maxLines: 5,
                              keyboard: TextInputType.name,
                              onChanged: (value) {
                                controller.businessDetails["intro_facts"] =
                                    value;
                              },
                              required: true,
                            ),
                            //Introduction / Facts
                            MyFormField(
                              initialValue:
                                  controller.businessDetails["contact_number"],
                              fieldName: "Contact Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              onChanged: (value) {
                                controller.businessDetails["contact_number"] =
                                    value;
                              },
                              required: true,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: ColorPallete.theme, boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: ColorPallete.grey.withOpacity(0.5),
                  ),
                ]),
                child: Padding(
                  padding: EdgeInsets.all(10.0 * fem),
                  child: InkWell(
                    onTap: () {
                      if (!controller.isLoading.value) {
                        controller.validateAndContinue(context, 1);
                      }
                    },
                    child: RoundedContainer(
                      radius: 10,
                      height: 50,
                      color: ColorPallete.primary,
                      child: controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorPallete.theme,
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 15.0 * fem),
                              child: Center(
                                child: TextView(
                                  text: controller.selectedTile.value > 4
                                      ? translations.submit.tr
                                      : translations.next.tr,
                                  color: ColorPallete.theme,
                                  fontSize: 16,
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
