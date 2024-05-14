import 'dart:math';

import 'package:get/get.dart';
import 'package:south_canara/app/models/vendor.dart';
import 'package:south_canara/app/repositories/vendor_repository.dart';
import 'package:south_canara/common/color_pallete.dart';

import '../../../models/api_response.dart';
import '../../../models/enquiry_model.dart';
import '../../../routes/app_routes.dart';

class VendorController extends GetxController {
  late VendorRepository _vendorRepository;
  VendorController() {
    _vendorRepository = VendorRepository();
  }

  @override
  void onInit() {
    super.onInit();
  }

  RxList<Map<String, String>> tabs = <Map<String, String>>[
    {"title": "Update Profile", "img": "", "route": Routes.VENDOR_PROFILE},
    {"title": "My Products", "img": "", "route": Routes.MY_PRODUCTS},
    {"title": "Enquires", "img": "", "route": Routes.MY_ENQUIRES},
    {"title": "Raise Ticket", "img": "", "route": Routes.RAISE_TICKET},
    {"title": "Our Subscription", "img": "", "route": Routes.SUBSCRIPTION},
    {"title": "Admin Messages", "img": "", "route": Routes.ADMIN_MESSAGES},
  ].obs;

  void launchTab(Map<String, String> element) {
    switch (element["title"]) {
      case "My Products":
        // fetchEnquires();
        break;
      case "Enquires":
        fetchEnquires();
        break;
      case "Raise Ticket":
        fetchTickets();
        break;
      case "Admin Messages":
        fetchAdminMessages();
        break;
      default:
    }
    Get.toNamed(element["route"].toString());
  }

  RxBool isLoading = false.obs;
  // ENQUIRES
  RxList<Enquiry> enquires = <Enquiry>[].obs;
  fetchEnquires() {
    isLoading.value = true;
    _vendorRepository.fetchEnquires().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        enquires.value = value.data;
      } else {
        enquires.value = [];
      }
    });
  }

  RxList<Map<String, String>> tickets = <Map<String, String>>[].obs;
  fetchTickets() {
    isLoading.value = true;
    tickets.value = [];
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      tickets.refresh();
    });
  }

  RxBool isCreatingTicket = false.obs;
  void addTicket() {
    isCreatingTicket.value = true;
    tickets.add({});
  }

  void submitTicket(Map<String, String> ticket) {
    isCreatingTicket.value = false;
    tickets.refresh();
  }

  // Admin Messages
  RxList<Map<String, String>> adminMessages = <Map<String, String>>[].obs;
  fetchAdminMessages() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      adminMessages.refresh();
    });
  }

  RxString gstImg = "".obs;

  //Profile
  Rx<Vendor> vendorDetails = Vendor().obs;

  fetchVendorDetails() async {
    await _vendorRepository.fetchVendorDetails().then((value) {
      vendorDetails = Vendor().obs;
      vendorDetails.value = value.data;
      vendorDetails.refresh();
    });
  }

  updateVendorDetails() async {
    await _vendorRepository
        .saveVendorDetails(vendorDetails.value)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: ColorPallete.primary,
            message: "Details were Updated Successfully !",
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: ColorPallete.red,
            message: "Error Updating Details !",
          ),
        );
      }
    });
  }
}
