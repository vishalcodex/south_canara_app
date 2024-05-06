import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/screens/category/widgets/category_view.dart';
import 'package:south_canara/app/screens/category/widgets/suppliers_view.dart';

import '../../../components/ui/my_list_view.dart';
import '../controllers/category_controller.dart';

// ignore: must_be_immutable
class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                child: Obx(
                  () => !controller.showSuppliers.value
                      ? const CategoriesView(
                          inHomeView: false,
                        )
                      : const SuppliersView(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
