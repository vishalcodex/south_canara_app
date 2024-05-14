import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/image_input.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../../signup/widgets/form_fields.dart';
import '../../controllers/product_controller.dart';

// ignore: must_be_immutable
class SubscriptionScreen extends GetView<ProductController> {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "My Subscription",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
