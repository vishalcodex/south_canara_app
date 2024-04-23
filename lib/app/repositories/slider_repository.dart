import 'package:get/get.dart';

import '../models/ads_model.dart';
import '../models/api_response.dart';
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
            .map((e) => Ads.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }
}
