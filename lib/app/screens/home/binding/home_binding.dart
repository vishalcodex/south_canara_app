import 'package:get/get.dart';
import '../../category/controllers/category_controller.dart';
import '../../vendor/controllers/product_controller.dart';
import '../../vendor/controllers/vendor_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.put<HomeController>(HomeController());
    Get.put<VendorController>(VendorController());
    Get.put<ProductController>(ProductController());
    // Get.put<MembershipController>(MembershipController());
  }
}
