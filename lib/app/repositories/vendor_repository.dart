import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/enquiry_model.dart';
import '../models/vendor.dart';
import '../providers/api_provider.dart';

class VendorRepository {
  late ApiProvider apiProvider;

  VendorRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchEnquires() async {
    return await apiProvider.makeAPICall("GET", "enquiry", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["enquires"] as List)
            .map((e) => Enquiry.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

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

  Future<ApiResponse> saveVendorDetails(Vendor vendor) async {
    return await apiProvider
        .makeAPICall("POST", "vendor/profile/update", vendor.toJson())
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // Vendor vendor = Vendor.fromJson(value.data["vendor"]);
        // value.data = vendor;
      }
      return value;
    });
  }
}
