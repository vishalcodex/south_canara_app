import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class VendorController extends GetxController {
  VendorController() {
    // _onBoardRepository = OnBoardRepository();
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
  RxList<Map<String, String>> enquires = <Map<String, String>>[].obs;
  fetchEnquires() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      enquires.value = [
        {
          "cust_name": "Omkar Mhatre",
          "product_name": "ABC",
          "location": "Panvel",
          "date": "2024/03/21 12:34 PM",
        },
        {
          "cust_name": "Vishal Shinde",
          "product_name": "XYZ",
          "location": "Vasai",
          "date": "2024/03/18 12:34 PM",
        },
        {
          "cust_name": "Saurav Patil",
          "product_name": "PQR",
          "location": "Virar",
          "date": "2024/03/09 12:34 PM",
        },
      ];
      enquires.refresh();
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
}
