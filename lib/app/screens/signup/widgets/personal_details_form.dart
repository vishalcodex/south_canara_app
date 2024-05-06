import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';
import 'form_fields.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class PersonalDetailsForm extends GetView<SignUpController> {
  const PersonalDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
      child: Column(
        children: [
          Obx(
            () => Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.personalDetailsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: translations.persoanalDetails.tr,
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      //Name
                      ImageInput(
                        callback: (img) {
                          controller.image.value = img;
                          controller.personalDetails["image"] = img;
                          controller.image.refresh();
                        },
                        child: controller.personalDetails["image"] != null ||
                                controller.personalDetails["image"] != ""
                            ? Center(
                                child: RoundedContainer(
                                  radius: 0,
                                  height: 100,
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      RoundedContainer(
                                        radius: 50,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        width: double.infinity,
                                        child: Image.file(
                                          File(controller.image.value),
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.network(
                                              controller
                                                  .personalDetails["image"],
                                              fit: BoxFit.fill,
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
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0 * fem, vertical: 5 * fem),
                                child: RoundedContainer(
                                  radius: 5,
                                  // borderColor: ColorPallete.grey,
                                  color: ColorPallete.grey.withOpacity(0.1),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0 * fem),
                                    child: MyTextField(
                                      enabled: false,
                                      initialValue:
                                          controller.personalDetails["image"],
                                      hintText: translations.profileImg.tr,
                                      textColor: ColorPallete.primary,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      //Name
                      MyFormField(
                        initialValue: controller.personalDetails["username"],
                        fieldName: translations.name.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        onChanged: (value) {
                          controller.personalDetails["username"] = value;
                        },
                        required: true,
                      ),
                      //Phone
                      MyFormField(
                        initialValue: controller.personalDetails["phone"],
                        fieldName: translations.phoneNumber.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.phone,
                        onChanged: (value) {
                          controller.personalDetails["phone"] = value;
                        },
                        required: true,
                      ),
                      //WhatsApp No.
                      MyFormField(
                        fieldName: translations.whatsappNumber.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.phone,
                        required: true,
                        initialValue: controller.personalDetails["whatsapp"],
                        onChanged: (value) {
                          controller.personalDetails["whatsapp"] = value;
                          controller.personalDetails["phone"] = value;
                        },
                      ),
                      // Telegram No.
                      MyFormField(
                        fieldName: translations.telegramNumber.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.phone,
                        initialValue: controller.personalDetails["telegram"],
                        onChanged: (value) {
                          controller.personalDetails["telegram"] = value;
                        },
                      ),
                      //Email
                      MyFormField(
                        fieldName: translations.email.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.emailAddress,
                        required: true,
                        initialValue: controller.personalDetails["email"],
                        onChanged: (value) {
                          controller.personalDetails["email"] = value;
                        },
                      ),
                      //DOB
                      MyFormField(
                        fieldName: translations.dob.tr,
                        type: InputType.DATE,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.personalDetails["dob"],
                        onChanged: (value) {
                          controller.personalDetails["dob"] = value;
                        },
                      ),
                      //Marriage Anniversary
                      MyFormField(
                        fieldName: translations.marriageAnniversary.tr,
                        type: InputType.DATE,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller
                            .personalDetails["marriage_anniversary_date"],
                        onChanged: (value) {
                          controller.personalDetails[
                              "marriage_anniversary_date"] = value;
                        },
                      ),
                      // Gender
                      MyFormField(
                        fieldName: translations.gender.tr,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        dropDownOptions: ["Male", "Female", "Other"],
                        required: true,
                        initialValue: controller.personalDetails["gender"],
                        onChanged: (value) {
                          controller.personalDetails["gender"] = value;
                        },
                      ),
                      // Blood Group
                      MyFormField(
                        fieldName: translations.bloodGrp.tr,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        dropDownOptions: const [
                          "A-",
                          "B-",
                          "AB-",
                          "O-",
                          "A+",
                          "B+",
                          "AB+",
                          "O+"
                        ],
                        initialValue: controller.personalDetails["blood_group"],
                        onChanged: (value) {
                          controller.personalDetails["blood_group"] = value;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.caste.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              dropDownOptions: controller.caste
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.caste
                                      .where((p0) =>
                                          p0.id.toString() ==
                                          (controller.personalDetails[
                                                  "caste_id"] ??
                                              ""))
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.caste
                                      .where((p0) =>
                                          p0.id.toString() ==
                                          (controller.personalDetails[
                                                  "caste_id"] ??
                                              ""))
                                      .toList()
                                      .first
                                      .name,
                              required: true,
                              onChanged: (value) {
                                controller.onCasteChanged(
                                  value,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.subCaste.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: controller.subCaste.length > 0,
                              dropDownOptions: controller.subCaste
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.subCaste
                                      .where((p0) =>
                                          p0.id.toString() ==
                                          (controller.personalDetails[
                                                  "sub_caste_id"] ??
                                              ""))
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.subCaste
                                      .where((p0) =>
                                          p0.id.toString() ==
                                          (controller.personalDetails[
                                                  "sub_caste_id"] ??
                                              ""))
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onSubCasteChanged(
                                  value,
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      // Aadhaar No.
                      MyFormField(
                        fieldName: translations.aadhaarNumber.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.number,
                        required: true,
                        initialValue:
                            controller.personalDetails["aadharcard_number"],
                        onChanged: (value) {
                          controller.personalDetails["aadharcard_number"] =
                              value;
                        },
                        validator: (value) {
                          return value == null ||
                                  value.isEmpty ||
                                  value.length != 12
                              ? "Invalid Aadhaar No."
                              : null;
                        },
                      ),
                      // PAN No.
                      MyFormField(
                        fieldName: translations.panNumber.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue:
                            controller.personalDetails["pancard_number"],
                        onChanged: (value) {
                          controller.personalDetails["pancard_number"] = value;
                        },
                        validator: (value) {
                          return value == null ||
                                  value.isEmpty ||
                                  value.length != 10
                              ? "Invalid PAN No."
                              : null;
                        },
                      ),
                      // Resedential Address
                      MyFormField(
                        fieldName: translations.resedentialAddress.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue: controller
                            .personalDetails["current_resident_address"],
                        onChanged: (value) {
                          controller
                                  .personalDetails["current_resident_address"] =
                              value;
                        },
                      ),
                      // Resedential District & Taluka
                      Row(
                        children: [
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.resedentialDistrict.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              dropDownOptions: controller.districts
                                  .map((element) => element.name)
                                  .toList(),
                              required: true,
                              initialValue: controller.districts
                                      .where((p0) =>
                                          p0.id.toString() ==
                                          (controller.personalDetails[
                                                  "current_district_id"] ??
                                              ""))
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.districts
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "current_district_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onDistrictChanged(value, true);
                              },
                            ),
                          ),
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.resedentialTaluka.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.currentTalukas
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.currentTalukas
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "current_taluka_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.currentTalukas
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "current_taluka_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onTalukaChanged(value, true);
                              },
                            ),
                          ),
                        ],
                      ),
                      // Resedential City & PinCode
                      Row(
                        children: [
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.resedentialCity.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.currentCities
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.currentCities
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "current_city_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.currentCities
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "current_city_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onCityChanged(value, true);
                              },
                            ),
                          ),
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.resedentialPinCode.tr,
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              required: true,
                              initialValue:
                                  controller.personalDetails["current_pincode"],
                              onChanged: (value) {
                                controller.personalDetails["current_pincode"] =
                                    value;
                              },
                              validator: (value) {
                                return value == null ||
                                        value.isEmpty ||
                                        value.length != 6
                                    ? "Invalid Pin Code"
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),
                      // Native Place
                      MyFormField(
                        fieldName: translations.nativeAddress.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue:
                            controller.personalDetails["native_address"],
                        onChanged: (value) {
                          controller.personalDetails["native_address"] = value;
                        },
                      ),
                      // Native Place District & Taluka
                      Row(
                        children: [
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.nativeDistrict.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              dropDownOptions: controller.districts
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.districts
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_district_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.districts
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_district_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              required: true,
                              onChanged: (value) {
                                controller.onDistrictChanged(value, false);
                              },
                            ),
                          ),
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.nativeTaluka.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.nativeTalukas
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.nativeTalukas
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_taluka_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.nativeTalukas
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_taluka_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onTalukaChanged(value, false);
                              },
                            ),
                          ),
                        ],
                      ),
                      // Native Place City & PinCode
                      Row(
                        children: [
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.nativeCity.tr,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.nativeCities
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: controller.nativeCities
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_city_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .isEmpty
                                  ? null
                                  : controller.nativeCities
                                      .where(
                                        (p0) =>
                                            p0.id.toString() ==
                                            controller.personalDetails[
                                                    "native_city_id"]
                                                .toString(),
                                      )
                                      .toList()
                                      .first
                                      .name,
                              onChanged: (value) {
                                controller.onCityChanged(value, false);
                              },
                            ),
                          ),
                          Expanded(
                            child: MyFormField(
                              fieldName: translations.nativePinCode.tr,
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              required: true,
                              initialValue:
                                  controller.personalDetails["native_pincode"],
                              onChanged: (value) {
                                controller.personalDetails["native_pincode"] =
                                    value;
                              },
                              validator: (value) {
                                return value == null ||
                                        value.isEmpty ||
                                        value.length != 6
                                    ? "Invalid Pin Code"
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),

                      // Nominee Name
                      MyFormField(
                        fieldName: translations.nomineeName.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue:
                            controller.personalDetails["nominee_name"],
                        onChanged: (value) {
                          controller.personalDetails["nominee_name"] = value;
                        },
                      ),
                      // Nominee Relation
                      MyFormField(
                        fieldName: translations.nomineeRelation.tr,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.text,
                        dropDownOptions: const [
                          "Son",
                          "Daughter",
                          "Father",
                          "Mother",
                          "Wife",
                          "Children"
                        ],
                        required: true,
                        initialValue:
                            controller.personalDetails["nominee_relation"],
                        onChanged: (value) {
                          controller.personalDetails["nominee_relation"] =
                              value;
                        },
                      ),
                      // Nominee DOB
                      MyFormField(
                        fieldName: translations.nomineeDob.tr,
                        type: InputType.DATE,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.personalDetails["nominee_dob"],
                        onChanged: (value) {
                          controller.personalDetails["nominee_dob"] = value;
                        },
                      ),
                      // Nominee Contact
                      MyFormField(
                        fieldName: translations.nomineeContact.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.phone,
                        required: true,
                        initialValue: controller
                            .personalDetails["nominee_contact_number"],
                        onChanged: (value) {
                          controller.personalDetails["nominee_contact_number"] =
                              value;
                        },
                      ),
                      // Nominee Education
                      MyFormField(
                        fieldName: translations.nomineeEducation.tr,
                        type: InputType.TEXT,
                        required: true,
                        keyboard: TextInputType.text,
                        initialValue:
                            controller.personalDetails["nominee_education"],
                        onChanged: (value) {
                          controller.personalDetails["nominee_education"] =
                              value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
