import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductController() {
    // _onBoardRepository = OnBoardRepository();
  }

  @override
  void onInit() {
    super.onInit();
  }

  RxList<Map<String, String>> products = <Map<String, String>>[].obs;

  void addUpdateProduct(bool isAdd) {}
}
