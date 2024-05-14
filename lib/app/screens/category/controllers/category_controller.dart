import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/location.dart';
import '../../../repositories/category_repository.dart';

class CategoryController extends GetxController {
  late CategoryRepository _categoryRepository;
  CategoryController() {
    _categoryRepository = CategoryRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchLocations();
    selectedCategory.listen((p0) {
      // if (p0["sub"] != null) {
      //   subCategories.value = p0["sub"];
      //   selectedSubCategory.value = (p0["sub"] as List).first;
      //   subCategories.refresh();
      // } else {
      //   subCategories.value = [];
      // }
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
      _categoryRepository.fetchCategories().then((value) {
        if (value.status == Status.COMPLETED) {
          categories.value = value.data;
          onCategorySelected(categories.first);
          categories.refresh();
        }
      });
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

  void onCategorySelected(Category category) {
    selectedCategory.value = category;
    selectedCategory.refresh();
    _categoryRepository.fetchSubCategories(category).then((value) {
      if (value.status == Status.COMPLETED) {
        subCategories.value = value.data;
        if (subCategories.isNotEmpty) {
          selectedSubCategory.value = subCategories.first;
        }
        subCategories.refresh();
      }
    });
  }

  void onSubCategorySelected(Subcategory subcategory) {
    selectedSubCategory.value = subcategory;
    selectedSubCategory.refresh();
  }
}
