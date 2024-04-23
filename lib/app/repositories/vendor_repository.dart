import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/enquiry_model.dart';
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
}
