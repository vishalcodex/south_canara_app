import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryController() {
    // _onBoardRepository = OnBoardRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchLocations();
    selectedCategory.listen((p0) {
      if (p0["sub"] != null) {
        subCategories.value = p0["sub"];
        selectedSubCategory.value = (p0["sub"] as List).first;
        subCategories.refresh();
      } else {
        subCategories.value = [];
      }
    });
  }

  RxMap<String, dynamic> selectedCategory = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> categories = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> selectedSubCategory = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> subCategories = <Map<String, dynamic>>[].obs;
  RxString selectedLocation = "Maharshtra".obs;
  RxList<Map<String, dynamic>> locations = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> suppliers = <Map<String, dynamic>>[].obs;

  fetchCategories() async {
    Future.delayed(const Duration(seconds: 2), () {
      categories.value = [
        {
          "name": "Cashew",
          "sub": [
            {"name": "Grade 1"},
            {"name": "Grade 2"},
            {"name": "Grade 3"},
            {"name": "Grade 4"},
          ]
        },
        {"name": "Badam"},
        {
          "name": "Anjeer",
          "sub": [
            {"name": "Grade 1"},
            {"name": "Grade 2"},
            {"name": "Grade 3"},
            {"name": "Grade 4"},
          ]
        },
        {
          "name": "Raisins",
        },
        {"name": "Walnuts"},
        {
          "name": "Dates",
          "sub": [
            {"name": "Grade 1"},
            {"name": "Grade 2"},
            {"name": "Grade 3"},
            {"name": "Grade 4"},
          ]
        },
        {"name": "Pista"},
        {"name": "Dry Coc"},
        {"name": "Prunes"},
        {"name": "Betel Nut"},
        {"name": "Hezel Nut"},
      ];
      selectedCategory.value = categories.first;
      categories.refresh();
    });
  }

  fetchLocations() async {
    Future.delayed(const Duration(seconds: 2), () {
      locations.value = [
        {"name": "Maharashtra"},
        {"name": "Tamil Nadu"},
        {"name": "Karnataka"},
        {"name": "Punjab"},
        {"name": "Madhya Pradesh"},
      ];
      selectedLocation.value = locations.first["name"];
      locations.refresh();
    });
  }

  RxBool showSuppliers = false.obs;
  void searchSuppliers() {
    showSuppliers.value = true;
  }
}
