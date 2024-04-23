import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/vendor_controller.dart';

class VendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorController>(() => VendorController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
