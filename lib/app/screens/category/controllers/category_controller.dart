import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/location.dart';
import '../../../repositories/category_repository.dart';

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

  //Category
  Rx<Category> selectedCategory = Category().obs;
  RxList<Category> categories = <Category>[].obs;
  //Sub Category
  Rx<Subcategory> selectedSubCategory = Subcategory().obs;
  RxList<Subcategory> subCategories = <Subcategory>[].obs;
  //Locations
  Rx<Location> selectedLocation = Location().obs;
  RxList<Location> locations = <Location>[].obs;
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
    _categoryRepository.fetchLocations().then((value) {
      locations.value = value.data;
      selectedLocation.value = locations.first;
      locations.refresh();
    });
  }

  RxBool showSuppliers = false.obs;
  void searchSuppliers() {
    showSuppliers.value = true;
  }
}
