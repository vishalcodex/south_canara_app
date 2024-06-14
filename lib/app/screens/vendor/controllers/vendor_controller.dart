import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/models/vendor.dart';
import 'package:south_canara/app/repositories/vendor_repository.dart';
import 'package:south_canara/common/color_pallete.dart';

import '../../../models/api_response.dart';
import '../../../models/city_model.dart';
import '../../../models/country_model.dart';
import '../../../models/country_state_model.dart';
import '../../../models/enquiry_model.dart';
import '../../../models/notification_modle.dart';
import '../../../models/ticket_model.dart';
import '../../../models/vendor_tab_model.dart';
import '../../../routes/app_routes.dart';

class VendorController extends GetxController {
  late VendorRepository _vendorRepository;
  VendorController() {
    _vendorRepository = VendorRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  final profileFormKey = GlobalKey<FormState>();

  RxList<VendorTab> tabs = <VendorTab>[].obs;

  void launchTab(VendorTab tab) {
    if (tab.status == "active") {
      switch (tab.label) {
        case "Update Buyer/Seller Profile":
          fetchVendorDetails();
          Get.toNamed(Routes.VENDOR_PROFILE);
          break;
        case "My Products":
          Get.toNamed(Routes.MY_PRODUCTS);
          break;
        case "Enquiries":
          Get.toNamed(Routes.MY_ENQUIRES);
          break;
        case "Raise Tickets":
          Get.toNamed(Routes.RAISE_TICKET);
          break;
        case "Our Subscription":
          Get.toNamed(Routes.SUBSCRIPTION);
          break;
        case "Admin Messages":
          Get.toNamed(Routes.ADMIN_MESSAGES);
          break;
        default:
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: ColorPallete.primary,
          message: "Update Your Profile to access this section !",
        ),
      );
    }
  }

  fetchData() {
    fetchCounts();
    fetchStates();
    fetchVendorDetails();
    fetchEnquires();
    fetchTickets();
    fetchAdminMessages();
  }

  RxBool isLoading = false.obs;

  RxString gstImg = "".obs;

  fetchCounts() async {
    tabs.value = [];
    await _vendorRepository.fetchCounts().then((value) {
      if (value.status == Status.COMPLETED) {
        tabs.value = value.data;
      }
    });
  }

  //Profile
  Rx<Vendor> vendorDetails = Vendor().obs;

  RxList<Country> countries = <Country>[].obs;
  // fetchCountries() async {
  //   await _vendorRepository.fetchCountries().then((value) {
  //     countries.value = value.data;
  //     if (vendorDetails.value.country != null) {
  //       onCountrySelected(vendorDetails.value.country!);
  //     }
  //     countries.refresh();
  //   });
  // }

  // void onCountrySelected(String value) {
  //   vendorDetails.value.country = value;
  //   Country selectedCountry = countries.where((p0) => p0.name == value).first;
  //   fetchStates(selectedCountry);
  //   vendorDetails.refresh();
  // }

  RxList<CountryState> states = <CountryState>[].obs;
  fetchStates() async {
    Country country = Country(id: 101);
    await _vendorRepository.fetchStates(country).then((value) {
      states.value = value.data;
      // cities.value = [];
      // if (vendorDetails.value.state != null) {
      //   onCountryStateSelected(vendorDetails.value.state!);
      // }
      states.refresh();
    });
  }

  void onCountryStateSelected(String value) {
    vendorDetails.value.state = value;
    CountryState selectedCountryState =
        states.where((p0) => p0.name == value).first;
    fetchCities(selectedCountryState);
    vendorDetails.refresh();
  }

  RxList<City> cities = <City>[].obs;
  fetchCities(CountryState countryState) async {
    await _vendorRepository.fetchCities(countryState).then((value) {
      cities.value = value.data;
      if (vendorDetails.value.city != null) {
        onCitySelected(vendorDetails.value.city!);
      }
      cities.refresh();
    });
  }

  void onCitySelected(String value) {
    vendorDetails.value.city = value;
    vendorDetails.refresh();
  }

  fetchVendorDetails() async {
    await _vendorRepository.fetchVendorDetails().then((value) {
      // vendorDetails = Vendor().obs;
      vendorDetails.value = value.data;
      vendorDetails.refresh();
    });
  }

  updateVendorDetails() async {
    isLoading.value = true;
    if (profileFormKey.currentState!.validate()) {
      await _vendorRepository
          .saveVendorDetails(vendorDetails.value)
          .then((value) {
        isLoading.value = false;
        if (value.status == Status.COMPLETED) {
          Future.delayed(const Duration(seconds: 5), () {
            Get.back();
            fetchCounts();
          });
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
    } else {
      isLoading.value = false;
    }
  }

  // ENQUIRES
  RxList<Enquiry> enquires = <Enquiry>[].obs;
  Rx<Vendor> buyer = Vendor().obs;
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

  // TICKETS
  RxList<Ticket> tickets = <Ticket>[].obs;
  fetchTickets() {
    isLoading.value = true;
    tickets.value = [];
    _vendorRepository.fetchTickets().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        tickets.value = value.data;
      } else {
        tickets.value = [];
      }
    });
  }

  RxBool isCreatingTicket = false.obs;
  void addTicket() {
    isCreatingTicket.value = true;
    tickets.add(Ticket());
  }

  void submitTicket(Ticket ticket) {
    _vendorRepository.raiseTicket(ticket).then((value) {
      if (value.status == Status.COMPLETED) {
        isCreatingTicket.value = false;
        fetchTickets();
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

  // Admin Messages
  RxList<Notify> adminMessages = <Notify>[].obs;
  fetchAdminMessages() {
    isLoading.value = true;
    adminMessages.value = [];
    _vendorRepository.fetchAdminMessages().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        adminMessages.value = value.data;
      } else {
        adminMessages.value = [];
      }
    });
  }

  void showBuyerProfile(Vendor? selectedBuyer) {
    buyer = Vendor().obs;
    buyer.value = selectedBuyer!;
    buyer.refresh();
    Get.toNamed(Routes.BUYER_DETAILS);
  }
}
