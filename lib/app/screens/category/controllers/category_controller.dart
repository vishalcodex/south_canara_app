import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/location.dart';
import '../../../models/supplier_model.dart';
import '../../../repositories/category_repository.dart';
import '../../../routes/app_routes.dart';

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
      if (scrollController.isAttached) {
        scrollController.scrollTo(
            index: categories.indexOf(p0),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubic);
      }
      // if (p0["sub"] != null) {
      //   subCategories.value = p0["sub"];
      //   selectedSubCategory.value = (p0["sub"] as List).first;
      //   subCategories.refresh();
      // } else {
      //   subCategories.value = [];
      // }
    });
  }

  ItemScrollController scrollController = ItemScrollController();

  //Category
  Rx<Category> selectedCategory = Category().obs;
  RxList<Category> categories = <Category>[].obs;
  //Sub Category
  Rx<Subcategory> selectedSubCategory = Subcategory().obs;
  RxList<Subcategory> subCategories = <Subcategory>[].obs;
  //Locations
  Rx<Location> selectedLocation = Location().obs;
  RxList<Location> locations = <Location>[].obs;

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
    fetchSuppliers();
  }

  void onLoactionChanged(String value) {
    selectedLocation.value =
        locations.where((p0) => p0.stateName == value).toList().first;
    fetchSuppliers();
  }

  void onCategorySelected(Category category) {
    selectedCategory.value = category;
    selectedCategory.refresh();
    selectedSubCategory.value = Subcategory();
    _categoryRepository.fetchSubCategories(category).then((value) {
      if (value.status == Status.COMPLETED) {
        subCategories.value = value.data;
        if (subCategories.isNotEmpty) {
          // selectedSubCategory.value = subCategories.first;
        }
        subCategories.refresh();
        fetchSuppliers();
      }
    });
  }

  void onSubCategorySelected(Subcategory subcategory) {
    selectedSubCategory.value = subcategory;
    selectedSubCategory.refresh();
    fetchSuppliers();
  }

  RxBool isLoading = false.obs;
  RxList<Supplier> suppliers = <Supplier>[].obs;
  Rx<Supplier> selectedSupplier = Supplier().obs;
  void fetchSuppliers() async {
    isLoading.value = true;
    suppliers.value = [];
    await _categoryRepository
        .fetchSuppliers(
            location: selectedLocation.value.stateName ?? "",
            category: selectedCategory.value.name ?? "",
            subcategory: selectedSubCategory.value.name ?? "")
        .then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        suppliers.value = value.data;
        suppliers.refresh();
      }
    });
  }

  RxDouble quantity = 0.0.obs;
  RxString location = "".obs;
  RxString error = "".obs;

  void sendEnquiry() async {
    var data = {
      "vendor_id": selectedSupplier.value.vendorId,
      "product_id": selectedSupplier.value.id,
      "quantity": quantity.value,
      "location": location.value,
    };
    await _categoryRepository.sendEnquiry(data).then((value) {
      if (value.status == Status.COMPLETED) {
        quantity.value = 0;
        location.value = "";
        Get.back();
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 3),
          message: "Enquiry Submitted Succesfully !",
        ));
      } else {}
    });
  }

  void onSupplierClicked(Supplier supplier) {
    selectedSupplier.value = supplier;
    selectedSupplier.refresh();
    Get.toNamed(Routes.PRODUCT_SUPPLIER_DETAILS);
  }
}
