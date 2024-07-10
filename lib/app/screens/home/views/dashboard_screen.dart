import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils.dart';
import '../../../components/ui/custom_bottom_nav_bar.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => closeAppAlert(context),
          child: Scaffold(
            key: controller.scaffoldKey,
            // extendBody: true,
            backgroundColor: ColorPallete.theme,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: ColorPallete.theme),
              backgroundColor: ColorPallete.primary,
              // leading: InkWell(
              //   onTap: () {
              //     controller.scaffoldKey.currentState!.openDrawer();
              //   },
              //   child: const Icon(
              //     Icons.menu,
              //     color: ColorPallete.primary,
              //   ),
              // ),
              title: Obx(
                () => TextView(
                  text: controller.bottomTabs[controller.setTabIndex.value]
                      ["title"],
                  color: ColorPallete.theme,
                  fontSize: 18,
                  weight: FontWeight.bold,
                ),
              ),
              actions: const [
                // InkWell(
                //   onTap: () async {
                //     await Get.find<AuthService>()
                //         .removeCurrentUser()
                //         .then((value) {
                //       // Get.offAndToNamed(Routes.AUTH);
                //       Get.offAllNamed(
                //         Routes.SPLASH,
                //         predicate: (route) => Get.currentRoute == "/splash",
                //       );
                //     });
                //   },
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                //     child: Icon(
                //       Icons.logout_rounded,
                //       color: ColorPallete.theme,
                //       size: 25 * fem,
                //     ),
                //   ),
                // )
              ],
            ),
            body: RoundedContainer(
              radius: 0,
              // height: MediaQuery.of(context).size.height,
              child: Obx(
                () => controller.getTabScreen(controller.setTabIndex.value),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(),
            drawer: const CustomDrawer(),
          ),
        ),
      ),
    );
  }
}
