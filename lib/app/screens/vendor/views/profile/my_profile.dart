import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/providers/api_endpoints.dart';
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
          body: Form(
            key: controller.profileFormKey,
            child: Column(
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
                                    RoundedContainer(
                                      borderColor: ColorPallete.primary,
                                      radius: 125,
                                      height: 125,
                                      width: 125,
                                      clip: Clip.antiAliasWithSaveLayer,
                                      child: RoundedContainer(
                                        radius: 124,
                                        height: 124,
                                        width: 124,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        child: Obx(
                                          () => CachedNetworkImage(
                                            imageUrl: Urls.getImageUrl(
                                                controller.vendorDetails.value
                                                        .profileImage ??
                                                    ""),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.file(
                                                File(controller.vendorDetails
                                                        .value.profileImage ??
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
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: ImageInput(
                                        callback: (img) {
                                          controller.vendorDetails.value
                                              .profileImage = img;
                                          controller.vendorDetails.refresh();
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: ColorPallete.primary,
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
                              height: 10 * fem,
                            ),
                            MyFormField(
                              fieldName: "Contact Person's Name",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              required: true,
                              initialValue:
                                  controller.vendorDetails.value.directorsName,
                              onChanged: (value) {
                                controller.vendorDetails.value.directorsName =
                                    value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Company Name",
                              initialValue:
                                  controller.vendorDetails.value.companyName,
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              required: true,
                              onChanged: (value) {
                                controller.vendorDetails.value.companyName =
                                    value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "User Type",
                              initialValue:
                                  controller.vendorDetails.value.userType,
                              type: InputType.DROP_DOWN,
                              required: true,
                              dropDownOptions: ["Buyer", "Seller"],
                              keyboard: TextInputType.text,
                              onChanged: (value) {
                                controller.vendorDetails.value.userType = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            //ADDRESS
                            MyFormField(
                              fieldName: "Address",
                              type: InputType.TEXT,
                              required: true,
                              keyboard: TextInputType.text,
                              initialValue:
                                  controller.vendorDetails.value.address,
                              onChanged: (value) {
                                controller.vendorDetails.value.address = value;
                                controller.vendorDetails.refresh();
                              },
                              maxLines: 3,
                            ),
                            Obx(
                              () => MyListView(
                                children: [
                                  // MyFormField(
                                  //   initialValue:
                                  //       controller.vendorDetails.value.country,
                                  //   fieldName: "Country",
                                  //   type: InputType.DROP_DOWN,
                                  //   keyboard: TextInputType.number,
                                  //   dropDownOptions: controller.countries
                                  //       .map((element) => element.name)
                                  //       .toList(),
                                  //   onChanged: (value) {
                                  //     controller.onCountrySelected(value);
                                  //   },
                                  // ),
                                  MyFormField(
                                    initialValue:
                                        controller.vendorDetails.value.state,
                                    fieldName: "State",
                                    type: InputType.DROP_DOWN,
                                    keyboard: TextInputType.number,
                                    required: true,
                                    dropDownOptions: controller.states
                                        .map((element) => element.name)
                                        .toList(),
                                    onChanged: (value) {
                                      controller.onCountryStateSelected(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //CITY
                            MyFormField(
                              initialValue: controller.vendorDetails.value.city,
                              fieldName: "City",
                              type: InputType.TEXT, required: true,
                              keyboard: TextInputType.text,
                              // dropDownOptions: controller.cities
                              //     .map((element) => element.name)
                              //     .toList(),
                              onChanged: (value) {
                                controller.onCitySelected(value);
                              },
                            ),
                            //GST
                            MyFormField(
                              fieldName: "GST Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              initialValue:
                                  controller.vendorDetails.value.gstNumber,
                              capitalisation: TextCapitalization.characters,
                              length: 15,
                              onChanged: (value) {
                                controller.vendorDetails.value.gstNumber =
                                    value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            // Obx(
                            //   () => ImageInput(
                            //     callback: (img) {
                            //       controller.vendorDetails.value.gstCopy = img;
                            //       controller.vendorDetails.refresh();
                            //     },
                            //     child: Padding(
                            //       padding: EdgeInsets.all(5 * fem),
                            //       child: (controller.vendorDetails.value
                            //                       .gstCopy ??
                            //                   "") !=
                            //               ""
                            //           ? RoundedContainer(
                            //               radius: 10,
                            //               height: 150,
                            //               width: double.infinity,
                            //               clip: Clip.antiAliasWithSaveLayer,
                            //               child: CachedNetworkImage(
                            //                 imageUrl: Urls.getImageUrl(
                            //                     controller.vendorDetails.value
                            //                             .gstCopy ??
                            //                         ""),
                            //                 fit: BoxFit.cover,
                            //                 errorWidget: (context, url, error) {
                            //                   return Image.file(
                            //                     File(controller.vendorDetails
                            //                             .value.gstCopy ??
                            //                         ""),
                            //                     fit: BoxFit.cover,
                            //                     errorBuilder: (context, error,
                            //                         stackTrace) {
                            //                       return const Icon(
                            //                         Icons.photo_outlined,
                            //                         size: 50,
                            //                         color: ColorPallete.grey,
                            //                       );
                            //                     },
                            //                   );
                            //                 },
                            //               ),
                            //             )
                            //           : RoundedContainer(
                            //               radius: 5,
                            //               color: ColorPallete.grey
                            //                   .withOpacity(0.1),
                            //               child: Padding(
                            //                 padding: EdgeInsets.all(15.0 * fem),
                            //                 child: const Row(
                            //                   children: [
                            //                     TextView(
                            //                       text: "Upload Copy Of GST",
                            //                       color: ColorPallete.grey,
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //     ),
                            //   ),
                            // ),
                            MyListView(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: const TextView(
                                    text: "GST Copy",
                                    fontSize: 14,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                                    );
                                    controller.vendorDetails.value.gstCopy =
                                        result?.files.first.path ?? "";
                                    controller.vendorDetails.refresh();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RoundedContainer(
                                      radius: 5,
                                      color: ColorPallete.grey.withOpacity(0.1),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0 * fem,
                                            horizontal: 10 * fem),
                                        child: Obx(
                                          () => Row(
                                            children: [
                                              (controller.vendorDetails.value
                                                              .gstCopy ??
                                                          "") ==
                                                      ""
                                                  ? const TextView(
                                                      text:
                                                          "Upload Copy Of GST",
                                                      color: ColorPallete.grey,
                                                    )
                                                  : Expanded(
                                                      child: TextView(
                                                        text: (controller
                                                                    .vendorDetails
                                                                    .value
                                                                    .gstCopy ??
                                                                "")
                                                            .split("/")
                                                            .last,
                                                        color: ColorPallete
                                                            .secondary,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //CONTACT
                            MyFormField(
                              fieldName: "Contact Number",
                              type: InputType.TEXT,
                              required: true,
                              keyboard: TextInputType.phone,
                              initialValue:
                                  controller.vendorDetails.value.contactNumber,
                              onChanged: (value) {
                                controller.vendorDetails.value.contactNumber =
                                    value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Alternate Contact Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.phone,
                              required: true,
                              initialValue: controller
                                  .vendorDetails.value.alternateContactNumber,
                              onChanged: (value) {
                                controller.vendorDetails.value
                                    .alternateContactNumber = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Nature Of Business",
                              type: InputType.DROP_DOWN,
                              dropDownOptions: const [
                                "Manufacturer",
                                "Trader/Wholesaler",
                                "Importer",
                                "Exporter",
                                "Agent"
                              ],
                              keyboard: TextInputType.text,
                              required: true,
                              initialValue: controller
                                  .vendorDetails.value.natureOfBusiness,
                              onChanged: (value) {
                                controller.vendorDetails.value
                                    .natureOfBusiness = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Leagal Status Of Firm",
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: const [
                                "Proprietorship",
                                "Partnership",
                                "Private Limited",
                                "Public Limited",
                                "Co-operative society",
                              ],
                              initialValue: controller
                                  .vendorDetails.value.legalStateOfFirm,
                              onChanged: (value) {
                                controller.vendorDetails.value
                                    .legalStateOfFirm = value;
                                controller.vendorDetails.refresh();
                              },
                            ),

                            MyFormField(
                              fieldName: "Email Id",
                              type: InputType.TEXT,
                              keyboard: TextInputType.emailAddress,
                              required: true,
                              initialValue:
                                  controller.vendorDetails.value.email,
                              onChanged: (value) {
                                controller.vendorDetails.value.email = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            //BANK
                            MyFormField(
                              fieldName: "Bank Name",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              initialValue:
                                  controller.vendorDetails.value.bankName,
                              onChanged: (value) {
                                controller.vendorDetails.value.bankName = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Bank Account Number",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              initialValue: controller
                                  .vendorDetails.value.bankAccountNumber,
                              onChanged: (value) {
                                controller.vendorDetails.value
                                    .bankAccountNumber = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "IFSC Code",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              capitalisation: TextCapitalization.characters,
                              initialValue:
                                  controller.vendorDetails.value.ifscCode,
                              onChanged: (value) {
                                controller.vendorDetails.value.ifscCode = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Beneficiary Name",
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              initialValue: controller
                                  .vendorDetails.value.beneficiaryName,
                              onChanged: (value) {
                                controller.vendorDetails.value.beneficiaryName =
                                    value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                            MyFormField(
                              fieldName: "Year Of Establishment",
                              type: InputType.TEXT,
                              keyboard: TextInputType.number,
                              length: 4,
                              required: true,
                              initialValue: controller
                                  .vendorDetails.value.yearOfEstablishment,
                              onChanged: (value) {
                                controller.vendorDetails.value
                                    .yearOfEstablishment = value;
                                controller.vendorDetails.refresh();
                              },
                            ),
                          ],
                        ),
                      ),
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
                      // Get.back();
                      if (!controller.isLoading.value) {
                        controller.updateVendorDetails();
                      }
                    },
                    child: RoundedContainer(
                      radius: 0,
                      color: ColorPallete.theme,
                      child: Padding(
                        padding: EdgeInsets.all(5.0 * fem),
                        child: RoundedContainer(
                          radius: 10,
                          height: 50,
                          color: ColorPallete.primary,
                          child: Obx(
                            () => controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPallete.theme,
                                    ),
                                  )
                                : Padding(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
