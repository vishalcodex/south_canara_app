import 'package:get/get.dart';
import 'package:south_canara/app/repositories/category_repository.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../../repositories/vendor_repository.dart';
import '../../../routes/app_routes.dart';

class ProductController extends GetxController {
  ProductController() {
    _vendorRepository = VendorRepository();
    _categoryRepository = CategoryRepository();
  }
  late VendorRepository _vendorRepository;
  late CategoryRepository _categoryRepository;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  //CATEGORY
  RxList<Category> categories = <Category>[].obs;
  RxList<Subcategory> subcategories = <Subcategory>[].obs;
  fetchCategories() async {
    _categoryRepository.fetchCategories().then((value) {
      categories.value = value.data;
      onCategorySelected(categories
          .where((p0) => p0.id == selectedProduct.value.categoryId)
          .toList()
          .first
          .name!);
    });
  }

  void onCategorySelected(String value) {
    Category selectedCategory =
        categories.where((p0) => p0.name == value).toList().first;
    selectedProduct.value.categoryId = selectedCategory.id;
    fetchSubCategories(selectedCategory);
  }

  void fetchSubCategories(Category category) async {
    subcategories.value = [];
    await _categoryRepository.fetchSubCategories(category).then((value) {
      subcategories.value = value.data;
      subcategories.refresh();
    });
  }

  void onSubCategorySelected(String value) {
    Subcategory selectedSubCategory =
        subcategories.where((p0) => p0.name == value).toList().first;
    selectedProduct.value.subcategoryId = selectedSubCategory.id;
    subcategories.refresh();
  }

  // PRODUCTS

  RxList<Product> products = <Product>[].obs;
  Rx<Product> selectedProduct = Product().obs;

  void fetchProducts() async {
    isLoading.value = true;
    await _vendorRepository.fetchMyProducts().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        products.value = value.data;
        products.refresh();
      }
    });
  }

  void onProductSelected(Product product) {
    selectedProduct = Product().obs;
    selectedProduct.value = product;
    fetchCategories();
    Get.toNamed(Routes.PRODUCT_DETAILS);
  }

  RxBool isLoading = false.obs;
  void addUpdateProduct(bool isAdd) {
    isLoading.value = false;
    _vendorRepository.addUpdateProduct(selectedProduct.value).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Future.delayed(const Duration(seconds: 5), () {
          Get.back();
          fetchProducts();
        });
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: ColorPallete.primary,
            message: "Product ${isAdd ? "Created" : "Updated"} Successfully !",
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: ColorPallete.red,
            message: value.message,
            // message: "Error ${isAdd ? "Creating" : "Updating"} Product !",
          ),
        );
      }
    });
  }
}
