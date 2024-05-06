import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/onBoard_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class TemplateController extends GetxController {
  RxList<OnBoard> onboardsScreens = <OnBoard>[].obs;

  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  PageController pageController = PageController();
  // WidgetsToImageController widgetsToImageController =
  //     WidgetsToImageController();

  // late OnBoardRepository _onBoardRepository;

  TemplateController() {
    // _onBoardRepository = OnBoardRepository();
  }

  @override
  void onInit() {
    super.onInit();
  }

  RxList<Map<String, dynamic>> themes = [
    {
      "name": "Theme 1",
      "description":
          "Fast money transfer and gauranted safe transaction with others.",
      "image": ""
    },
    {
      "name": "Theme 2",
      "description":
          "Fast money transfer and gauranted safe transaction with others.",
      "image": ""
    },
    {
      "name": "Theme 3",
      "description":
          "Fast money transfer and gauranted safe transaction with others.",
      "image": ""
    },
  ].obs;
  RxMap<String, dynamic> selectedTheme = <String, dynamic>{}.obs;

  void toPreviewSelectedTheme(Map<String, dynamic> element) {
    selectedTheme.value = element;
    Get.toNamed(Routes.TEMPLATE_PREVIEW);
  }

  void onThemeSelected() {
    Get.toNamed(Routes.BUSINESS_DETAIL_FORM);
  }
}
