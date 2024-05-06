import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/business_up_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../widgets/form_fields.dart';

// ignore: must_be_immutable
class BusinessContactUsFormScreen extends GetView<BusinessController> {
  const BusinessContactUsFormScreen({Key? key}) : super(key: key);

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
              text: "Business Contact Us Form",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0 * fem, vertical: 10 * fem),
                  child: MyListView(
                    scroll: true,
                    children: [
                      Column(
                        children: [
                          //Address
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["address"],
                            fieldName: "Address",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["address"] = value;
                            },
                            required: true,
                          ),
                          //Phone Number
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["phone_number"],
                            fieldName: "Phone Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["phone_number"] =
                                  value;
                            },
                            required: true,
                          ),
                          //Whatsapp Number
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["whatsapp_number"],
                            fieldName: "Whatsapp Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["whatsapp_number"] =
                                  value;
                            },
                            required: true,
                          ),
                          //Email Id
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["emial_id"],
                            fieldName: "Email Id",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["emial_id"] = value;
                            },
                            required: true,
                          ),
                          //Facebook URL
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["facebook_url"],
                            fieldName: "Facebook URL",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["facebook_url"] =
                                  value;
                            },
                            required: true,
                          ),
                          //Instagram URL
                          MyFormField(
                            initialValue:
                                controller.contactUsDetails["instagram_url"],
                            fieldName: "Instagram URL",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails["instagram_url"] =
                                  value;
                            },
                            required: true,
                          ),
                          //Contact Person Name
                          MyFormField(
                            initialValue: controller
                                .contactUsDetails["contact_person_name"],
                            fieldName: "Contact Person Name",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller
                                      .contactUsDetails["contact_person_name"] =
                                  value;
                            },
                            required: true,
                          ),
                          //Contact Person Phone Number
                          MyFormField(
                            initialValue: controller
                                .contactUsDetails["contact_person_ph_number"],
                            fieldName: "Contact Person Phone Number",
                            type: InputType.TEXT,
                            keyboard: TextInputType.name,
                            onChanged: (value) {
                              controller.contactUsDetails[
                                  "contact_person_ph_number"] = value;
                            },
                            required: true,
                          ),
                        ],
                      ),
                    ],
                  ),
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
                        controller.validateAndContinue(context, 4);
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
                                  text: translations.submit.tr,
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
