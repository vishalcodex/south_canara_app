import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../services/auth_service.dart';
import '../controllers/membership_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class MemebrshipScreen extends GetView<MembershipController> {
  const MemebrshipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Stack(
                  children: [
                    MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: MyListView(
                            children: [
                              WidgetsToImage(
                                child: _getMembershipCard(context),
                                controller: controller.frontCardController,
                              ),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _getMemberDetails(context),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _getWorkingDetails(context),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _getPoliticalDetails(context),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _getFamilyDetails(context),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              _getSchemeDetails(context),
                              SizedBox(
                                height: 10 * fem,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (controller.isLoading.value)
                      RoundedContainer(
                        radius: 0,
                        color: ColorPallete.theme.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     if (!controller.isLoading.value) {
      //       controller.downloadMembershipCard();
      //     }
      //   },
      //   child: CircleAvatar(
      //     radius: 20 * fem,
      //     backgroundColor: ColorPallete.primary,
      //     child: Obx(
      //       () => controller.isLoading.value
      //           ? Container(
      //               margin: const EdgeInsets.all(5),
      //               child: const CircularProgressIndicator(
      //                 color: ColorPallete.theme,
      //               ),
      //             )
      //           : Icon(
      //               Icons.file_download_outlined,
      //               color: ColorPallete.theme,
      //               size: 25 * fem,
      //             ),
      //     ),
      //   ),
      // ),
    );
  }

  _getMembershipCard(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0 * fem, vertical: 10 * fem),
      child: RoundedContainer(
        radius: 5,
        clip: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/ui/front.jpeg"),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Member Profile Picture
                          Expanded(
                            child: RoundedContainer(
                              radius: 10,
                              height: 75,
                              clip: Clip.antiAliasWithSaveLayer,
                              color: ColorPallete.primary.withOpacity(0.5),
                              borderColor: Color(0xff1c7797),
                              borderWidth: 2,
                              child: Center(
                                child: RoundedContainer(
                                  radius: 10,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                    controller.personalDetails.value.image!,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.person_outline_sharp,
                                        color: ColorPallete.theme,
                                        size: 25 * fem,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Member Details
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: MyListView(
                                children: [
                                  _getCardEntry(
                                    "Name",
                                    controller.personalDetails.value.name ??
                                        Get.find<AuthService>()
                                            .user
                                            .value
                                            .name!,
                                  ),
                                  _getCardEntry(
                                    "ID",
                                    controller.personalDetails.value.userId
                                        .toString(),
                                  ),
                                  _getCardEntry(
                                    "D.O.B",
                                    (controller.personalDetails.value.dob ?? "")
                                        .replaceAll("-", "/"),
                                  ),
                                  _getCardEntry(
                                    "Address",
                                    "${controller.personalDetails.value.nativeTaluka!.name}, ${controller.personalDetails.value.nativeDistrict!.name}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Member QR
                          Expanded(
                            child: RoundedContainer(
                              radius: 10,
                              height: 60,
                              color: ColorPallete.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getMemberDetails(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        TextView(
          text: translations.membershipDetails.tr,
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        RoundedContainer(
          radius: 0,
          borderColor: ColorPallete.secondary,
          child: MyListView(
            children: [
              SizedBox(
                height: 5 * fem,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: MyListView(
                      children: [
                        DetailEntryWidget(
                          title: translations.memberName.tr,
                          value: controller.personalDetails.value.name ??
                              Get.find<AuthService>().user.value.name ??
                              "N/A",
                        ),
                        DetailEntryWidget(
                          title: translations.phoneNumber.tr,
                          value:
                              controller.personalDetails.value.phone ?? "N/A",
                        ),
                        DetailEntryWidget(
                          title: translations.email.tr,
                          value:
                              controller.personalDetails.value.email ?? "N/A",
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Stack(
                        children: [
                          // RoundedContainer(
                          //   radius: 150,
                          //   clip: Clip.antiAliasWithSaveLayer,
                          //   height: 120,
                          //   width: 120,
                          //   color: ColorPallete.grey.withOpacity(0.5),
                          //   child: Image.network(
                          //     controller.personalDetails.value.image!,
                          //     fit: BoxFit.fill,
                          //     errorBuilder: (context, error, stackTrace) {
                          //       return Icon(
                          //         Icons.person_outline_sharp,
                          //         color: ColorPallete.theme,
                          //         size: 75 * fem,
                          //       );
                          //     },
                          //   ),
                          // ),
                          // Positioned(
                          //   bottom: 0,
                          //   right: 10 * fem,
                          //   child: const CircleAvatar(
                          //     backgroundColor: ColorPallete.primary,
                          //     child: Icon(
                          //       Icons.camera_alt_outlined,
                          //       color: ColorPallete.theme,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.gender.tr,
                      value: controller.personalDetails.value.gender ?? "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.bloodGrp.tr,
                      value:
                          controller.personalDetails.value.bloodGroup ?? "N/A",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.dob.tr,
                      value: controller.personalDetails.value.dob ?? "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.marriageAnniversary.tr,
                      value: controller
                              .personalDetails.value.marriageAnniversaryDate ??
                          "N/A",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.resedentialAddress.tr,
                      value:
                          "${controller.personalDetails.value.currentResidentAddress!},\n${controller.personalDetails.value.currentDistrict!.name},${controller.personalDetails.value.currentTaluka!.name},\n${controller.personalDetails.value.currentCity!.name},${controller.personalDetails.value.currentPincode!}",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.nativeAddress.tr,
                      value:
                          "${controller.personalDetails.value.nativeAddress!},\n${controller.personalDetails.value.nativeDistrict!.name},${controller.personalDetails.value.nativeTaluka!.name},\n${controller.personalDetails.value.nativeCity!.name},${controller.personalDetails.value.nativePincode}",
                    ),
                  ),
                ],
              ),
              if (controller.personalDetails.value.caste != null)
                Row(
                  children: [
                    Expanded(
                      child: DetailEntryWidget(
                        title: translations.caste.tr,
                        value:
                            "${controller.personalDetails.value.caste!.name}",
                      ),
                    ),
                    Expanded(
                      child: DetailEntryWidget(
                        title: translations.subCaste.tr,
                        value:
                            controller.personalDetails.value.subCaste?.name ??
                                "N/A",
                      ),
                    ),
                  ],
                ),
              DetailEntryWidget(
                  title: translations.nomineeName.tr,
                  value: controller.personalDetails.value.nomineeName ?? "N/A"),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.nomineeContact.tr,
                      value: controller
                              .personalDetails.value.nomineeContactNumber ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.nomineeDob.tr,
                        value: controller.personalDetails.value.nomineeDob ??
                            "N/A"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.nomineeRelation.tr,
                      value: controller.personalDetails.value.nomineeRelation ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.nomineeEducation.tr,
                        value:
                            controller.personalDetails.value.nomineeEducation ??
                                "N/A"),
                  ),
                ],
              ),
              SizedBox(
                height: 5 * fem,
              )
            ],
          ),
        ),
      ],
    );
  }

  _getWorkingDetails(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        TextView(
          text: translations.companyDetails.tr,
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        RoundedContainer(
          radius: 0,
          borderColor: ColorPallete.secondary,
          child: MyListView(
            children: [
              SizedBox(
                height: 5 * fem,
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.occupCategory.tr,
                      value: controller
                              .workingDetails.value.occupationCategory?.name ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.subOccupCategory.tr,
                        value: controller.workingDetails.value
                                .occupationSubcategory?.name ??
                            "N/A"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.midcName.tr,
                      value: controller.workingDetails.value.midcName ?? "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.companyName.tr,
                        value: controller.workingDetails.value.companyName ??
                            "N/A"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.accPerson.tr,
                      value: controller
                              .workingDetails.value.accountablePersonName ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.accPersonContactNumber.tr,
                        value: controller.workingDetails.value
                                .accountablePersonContactNumber ??
                            "N/A"),
                  ),
                ],
              ),
              DetailEntryWidget(
                title: translations.companyAddress.tr,
                value:
                    "${controller.workingDetails.value.companyAddress},${controller.workingDetails.value.companyPincode!}",
              ),
              SizedBox(
                height: 5 * fem,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getPoliticalDetails(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        TextView(
          text: translations.politicalDetails.tr,
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        RoundedContainer(
          radius: 0,
          borderColor: ColorPallete.secondary,
          child: MyListView(
            children: [
              SizedBox(
                height: 5 * fem,
              ),
              DetailEntryWidget(
                title: translations.mhpardeshiCommittee.tr,
                value: controller.politicalDetails.value.mpCommittee?.name ??
                    "N/A",
              ),
              DetailEntryWidget(
                title: translations.regionalCommittee.tr,
                value:
                    controller.politicalDetails.value.regionalCommittee?.name ??
                        "N/A",
              ),
              DetailEntryWidget(
                title: translations.districtCityCommittee.tr,
                value:
                    controller.politicalDetails.value.districtCommittee?.name ??
                        "N/A",
              ),
              DetailEntryWidget(
                title: translations.talukaCommittee.tr,
                value:
                    controller.politicalDetails.value.talukaCommittee?.name ??
                        "N/A",
              ),
              DetailEntryWidget(
                title: translations.villageWardCommittee.tr,
                value: controller
                        .politicalDetails.value.villageWardCommittee?.name ??
                    "N/A",
              ),
              SizedBox(
                height: 5 * fem,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getFamilyDetails(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        TextView(
          text: translations.familyDetails.tr,
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        RoundedContainer(
          radius: 0,
          borderColor: ColorPallete.secondary,
          child: MyListView(
            children: [
              SizedBox(
                height: 5 * fem,
              ),
              DetailEntryWidget(
                title: translations.fatherName.tr,
                value: controller.familyDetails.value.fatherName ?? "N/A",
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.fatherContactNumber.tr,
                      value:
                          controller.familyDetails.value.fatherContactNumber ??
                              "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.fatherDOB.tr,
                        value:
                            controller.familyDetails.value.fatherDob ?? "N/A"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.fatherPersonType.tr,
                      value: controller.familyDetails.value.fatherPersonType ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.fatherEducation.tr,
                        value: controller.familyDetails.value.fatherEducation ??
                            "N/A"),
                  ),
                ],
              ),
              DetailEntryWidget(
                title: translations.motherName.tr,
                value: controller.familyDetails.value.motherName ?? "N/A",
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.motherContactNumber.tr,
                      value:
                          controller.familyDetails.value.motherContactNumber ??
                              "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.motherDOB.tr,
                        value:
                            controller.familyDetails.value.motherDob ?? "N/A"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DetailEntryWidget(
                      title: translations.motherPersonType.tr,
                      value: controller.familyDetails.value.motherPersonType ??
                          "N/A",
                    ),
                  ),
                  Expanded(
                    child: DetailEntryWidget(
                        title: translations.motherEducation.tr,
                        value: controller.familyDetails.value.motherEducation ??
                            "N/A"),
                  ),
                ],
              ),
              if (controller.familyDetails.value.wifeName != null)
                MyListView(
                  children: [
                    DetailEntryWidget(
                      title: translations.wifeName.tr,
                      value: controller.familyDetails.value.wifeName ?? "N/A",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.wifeContactNumber.tr,
                            value: controller
                                    .familyDetails.value.wifeContactNumber ??
                                "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.wifeDOB.tr,
                              value: controller.familyDetails.value.wifeDob ??
                                  "N/A"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.wifePersonType.tr,
                            value:
                                controller.familyDetails.value.wifePersonType ??
                                    "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.wifeEducation.tr,
                              value: controller
                                      .familyDetails.value.wifeEducation ??
                                  "N/A"),
                        ),
                      ],
                    ),
                  ],
                ),
              if (controller.familyDetails.value.child1Name != null)
                MyListView(
                  children: [
                    DetailEntryWidget(
                      title: translations.children1Name.tr,
                      value: controller.familyDetails.value.child1Name ?? "N/A",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.children1ContactNumber.tr,
                            value: controller
                                    .familyDetails.value.child1ContactNumber ??
                                "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.children1DOB.tr,
                              value: controller.familyDetails.value.child1Dob ??
                                  "N/A"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.children1PersonType.tr,
                            value: controller
                                    .familyDetails.value.child1PersonType ??
                                "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.children1Education.tr,
                              value: controller
                                      .familyDetails.value.child1Education ??
                                  "N/A"),
                        ),
                      ],
                    ),
                  ],
                ),
              if (controller.familyDetails.value.child2Name != null)
                MyListView(
                  children: [
                    DetailEntryWidget(
                      title: translations.children2Name.tr,
                      value: controller.familyDetails.value.child2Name ?? "N/A",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.children2ContactNumber.tr,
                            value: controller
                                    .familyDetails.value.child2ContactNumber ??
                                "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.children2DOB.tr,
                              value: controller.familyDetails.value.child2Dob ??
                                  "N/A"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailEntryWidget(
                            title: translations.children2PersonType.tr,
                            value: controller
                                    .familyDetails.value.child2PersonType ??
                                "N/A",
                          ),
                        ),
                        Expanded(
                          child: DetailEntryWidget(
                              title: translations.children2Education.tr,
                              value: controller
                                      .familyDetails.value.child2Education ??
                                  "N/A"),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(
                height: 5 * fem,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getSchemeDetails(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        TextView(
          text: translations.schemeDetails.tr,
          color: ColorPallete.secondary,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: 10 * fem,
        ),
        RoundedContainer(
          radius: 0,
          borderColor: ColorPallete.secondary,
          child: MyListView(
            children: [
              SizedBox(
                height: 5 * fem,
              ),
              DetailEntryWidget(
                title: translations.optedForScheme.tr,
                value: controller.schemeDetails.value.optGovtSchemeBefore == 1
                    ? translations.yes.tr
                    : translations.no.tr,
              ),
              DetailEntryWidget(
                title: translations.schemeName.tr,
                value: controller.schemeDetails.value.name ?? "N/A",
              ),
              SizedBox(
                height: 5 * fem,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getCardEntry(String field, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextView(
                color: ColorPallete.secondary,
                weight: FontWeight.w600,
                text: field),
          ),
          const TextView(
              color: ColorPallete.secondary,
              weight: FontWeight.w600,
              text: " : "),
          Expanded(
            flex: 2,
            child: TextView(
                color: ColorPallete.secondary,
                weight: FontWeight.w600,
                text: value),
          ),
        ],
      ),
    );
  }
}

class DetailEntryWidget extends StatelessWidget {
  final String title;
  final String value;

  const DetailEntryWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15 * fem, vertical: 7.5 * fem),
      child: RoundedContainer(
        radius: 0,
        color: ColorPallete.theme,
        child: MyListView(
          children: [
            TextView(
              text: title,
              color: ColorPallete.grey,
              weight: FontWeight.w400,
              fontSize: 10,
            ),
            SizedBox(
              height: 2.5 * fem,
            ),
            TextView(
              text: value,
              color: ColorPallete.primary,
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
