import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../routes/app_routes.dart';
import '../../../services/phonepe_gateway_service.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class BusinessController extends GetxController {
  BusinessController() {}

  @override
  void onInit() {
    super.onInit();

    // selectedTile.listen((p0) {
    //   switch (p0) {
    //     case 2:
    //       fetchMpCommitees();
    //       break;
    //     case 3:
    //       fetchOccupationCategories();
    //       break;
    //     default:
    //   }
    // });
  }

  RxBool isAuthenticated = false.obs;
  RxInt selectedTile = 1.obs;

  RxString image = "".obs;
  Map<String, dynamic> businessDetails = {};
  Map<String, dynamic> contactUsDetails = {};

  List<String> stepsLabel = [
    translations.persoanalDetails.tr,
    translations.politicalDetails.tr,
    translations.workingDetails.tr,
    translations.familyDetails.tr,
    translations.schemeDetails.tr,
    // "Personal Details"
    // "Political Details",
    // "Working Details",
    // "Family Details",
    // "Scheme Details"
  ];

  GlobalKey<FormState> businessDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessTestimonialFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessContactUsFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void validateAndContinue(context, int stage) async {
    // selectedTile.value = 5;
    GlobalKey<FormState> key = stage == 1
        ? businessDetailsFormKey
        : selectedTile.value == 2
            ? businessCategoryFormKey
            : selectedTile.value == 3
                ? businessTestimonialFormKey
                : businessContactUsFormKey;
    // if (key.currentState!.validate()) {
    var result = false;
    // isLoading.value = true;
    switch (stage) {
      case 1:
        // result = await _membershipRepository
        //     .savePersonalDetails(
        //       personalDetails,
        //     )
        //     .then((value) => value.data);

        Get.toNamed(Routes.BUSINESS_CATEGORY_FORM);
        break;
      case 2:
        // result = await _membershipRepository
        //     .savePoliticalDetails(politicalDetails)
        //     .then((value) => value.data);
        Get.toNamed(Routes.BUSINESS_TESTIMONIALS_FORM);
        break;
      case 3:
        // result = await _membershipRepository
        //     .saveWorkingDetails(workingDetails)
        //     .then((value) => value.data);
        Get.toNamed(Routes.BUSINESS_CONTACT_US_FORM);
        break;
      case 4:
        // result = await _membershipRepository
        //     .saveFamilyDetails(familyDetails)
        //     .then((value) => value.data);
        Get.toNamed(Routes.PAYMENT);
        break;

      default:
        result = false;
    }

    result = true;
    isLoading.value = false;
    if (result) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: ColorPallete.primary,
        duration: const Duration(seconds: 2),
        message: translations.detailsSubmitted.tr,
      ));

      // if (stage == 4) {
      //   if (!isAuthenticated.value) {
      //     Get.showSnackbar(
      //       GetSnackBar(
      //         duration: const Duration(seconds: 2),
      //         message: translations.settingAppToHome.tr,
      //       ),
      //     );
      //   }

      //   Future.delayed(const Duration(seconds: 1), () {
      //     Get.offAllNamed(
      //       Routes.HOME,
      //       predicate: (route) => Get.currentRoute == "/home",
      //     );
      //     // paymentGateway(context).then((value) {});
      //   });
      // }
    } else {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: ColorPallete.red,
        duration: const Duration(seconds: 2),
        message: translations.errorUpdatingDetails.tr,
      ));
    }
    // }
  }

  Future<bool> paymentGateway(context) async {
    return await PhonePePG()
        .getInstance
        .startPGTransaction(context, "1", 123456789, "8459510732");
  }

  RxList<Map<String, dynamic>> categories = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> testimonials = <Map<String, dynamic>>[].obs;
}
