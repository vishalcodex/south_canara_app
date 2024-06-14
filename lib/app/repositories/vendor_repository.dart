import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';
import '../models/country_state_model.dart';
import '../models/enquiry_model.dart';
import '../models/notification_modle.dart';
import '../models/product_model.dart';
import '../models/ticket_model.dart';
import '../models/vendor.dart';
import '../models/vendor_tab_model.dart';
import '../providers/api_provider.dart';

import 'package:dio/dio.dart' as dio;

class VendorRepository {
  late ApiProvider apiProvider;

  VendorRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  //COUNTRY
  Future<ApiResponse> fetchCounts() async {
    return await apiProvider.makeAPICall("GET", "count", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => VendorTab.fromJson(e))
            .toList();
        // value.data = [
        //   {"label": "Update Profile", "total": "", "status": "active"},
        //   {"label": "My Products", "total": 1, "status": "active"},
        //   {"label": "Enquiries", "total": 1, "status": "active"},
        //   {"label": "Raise Tickets", "total": 3, "status": "active"},
        //   {"label": "Our Subscription", "total": "", "status": "active"},
        //   {"label": "Admin Messages", "total": "", "status": "active"}
        // ];
      }
      return value;
    });
  }

  //COUNTRY
  Future<ApiResponse> fetchCountries() async {
    return await apiProvider.makeAPICall("GET", "countries", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["countries"] as List)
            .map((e) => Country.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  //STATE
  Future<ApiResponse> fetchStates(Country country) async {
    return await apiProvider
        .makeAPICall("GET", "countries/${country.id}/states", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["states"] as List)
            .map((e) => CountryState.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  //CITY
  Future<ApiResponse> fetchCities(CountryState state) async {
    return await apiProvider
        .makeAPICall("GET", "states/${state.id}/cities", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["cities"] as List)
            .map((e) => City.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  //VENDOR DETAILS
  Future<ApiResponse> fetchVendorDetails() async {
    return await apiProvider
        .makeAPICall("GET", "vendor/profile", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        Vendor vendor = Vendor.fromJson(value.data["vendor"]);
        value.data = vendor;
      }
      return value;
    });
  }

  //UPDATE VENDOR DETAILS
  Future<ApiResponse> saveVendorDetails(Vendor vendor) async {
    var body = dio.FormData.fromMap(vendor.toJson());
    if (vendor.profileImage != null &&
        !vendor.profileImage!.contains("profile")) {
      body.fields.removeWhere((element) => element.key == "profile_image");
      body.files.add(
        MapEntry(
          "profile_image",
          await dio.MultipartFile.fromFile(vendor.profileImage!,
              filename: vendor.profileImage.toString().split("/").last),
        ),
      );
    }
    if (vendor.gstCopy != null && !vendor.gstCopy!.contains("gst_copies")) {
      body.fields.removeWhere((element) => element.key == "gst_copy");
      body.files.add(
        MapEntry(
          "gst_copy",
          await dio.MultipartFile.fromFile(vendor.gstCopy!,
              filename: vendor.gstCopy.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall("POST", "vendor/profile/update", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // Vendor vendor = Vendor.fromJson(value.data["vendor"]);
        // value.data = vendor;
      }
      return value;
    });
  }

  //PRODUCTS
  Future<ApiResponse> fetchMyProducts() async {
    return await apiProvider
        .makeAPICall("GET", "vendor/products", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["products"] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  //UPDATE PRODUCTS
  Future<ApiResponse> addUpdateProduct(Product product) async {
    bool isAdd = (product.id ?? -1) == -1;
    var body = dio.FormData.fromMap(product.toJson());
    if (product.productImage != null &&
        !product.productImage!.contains("products")) {
      body.fields.removeWhere((element) => element.key == "product_image");
      body.files.add(
        MapEntry(
          "product_image",
          await dio.MultipartFile.fromFile(product.productImage!,
              filename: product.productImage.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
      "POST",
      "vendor/product${isAdd ? "" : "/${product.id}"}",
      body,
    )
        .then((value) {
      if (value.status == Status.COMPLETED) {}
      return value;
    });
  }

  //ENQUIRY
  Future<ApiResponse> fetchEnquires() async {
    return await apiProvider.makeAPICall("GET", "enquiry", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["enquiries"] as List)
            .map((e) => Enquiry.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

  //TICKETS
  Future<ApiResponse> fetchTickets() async {
    return await apiProvider
        .makeAPICall("GET", "vendor/ticket", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["tickets"] as List)
            .map((e) => Ticket.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

  Future<ApiResponse> raiseTicket(Ticket ticket) async {
    return await apiProvider
        .makeAPICall("POST", "vendor/ticket", ticket.toJson())
        .then((value) {
      if (value.status == Status.COMPLETED) {}
      return value;
    });
  }

  Future<ApiResponse> fetchAdminMessages() async {
    return await apiProvider
        .makeAPICall("GET", "notifications", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["notifications"] as List)
            .map((e) => Notify.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }
}
