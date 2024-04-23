import 'package:get/get.dart';
import '../../category/controllers/category_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.put<HomeController>(HomeController());
    // Get.put<MembershipController>(MembershipController());
  }
}