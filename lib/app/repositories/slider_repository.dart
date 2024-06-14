import 'package:get/get.dart';

import '../models/slide_model.dart';
import '../models/api_response.dart';
import '../models/package_model.dart';
import '../providers/api_provider.dart';

class SliderRepository {
  late ApiProvider apiProvider;

  SliderRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSliders() async {
    return await apiProvider.makeAPICall("GET", "sliders", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["sliders"] as List)
            .map((e) => Slide.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

  Future<ApiResponse> fetchPackages() async {
    return await apiProvider.makeAPICall("GET", "packages", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["packages"] as List)
            .map((e) => Package.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }
}
