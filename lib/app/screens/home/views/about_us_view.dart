import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class AboutUsView extends GetView<HomeController> {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
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
            title: const TextView(
              text: "About Us",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorPallete.primary,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * fem, vertical: 20 * fem),
                      child: RoundedContainer(
                        radius: 10,
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: MyListView(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/ui/profile.png",
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: TextView(
                                    text: "South Canara",
                                    fontSize: 20,
                                    color: ColorPallete.primary,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: TextView(
                                    text: "All Rights Reserved.",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: TextView(
                                    text: "Version 1.0.0 v1",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextView(
                                        text: "Contact Us :",
                                        fontSize: 14,
                                        color: ColorPallete.secondary,
                                        weight: FontWeight.w400,
                                      ),
                                      TextView(
                                        text: "info@southcanara.com",
                                        fontSize: 14,
                                        color: ColorPallete.primary,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextView(
                                        text: "Website :",
                                        fontSize: 14,
                                        color: ColorPallete.secondary,
                                        weight: FontWeight.w400,
                                      ),
                                      TextView(
                                        text: "https://southcanara.com",
                                        fontSize: 14,
                                        color: ColorPallete.primary,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: TextView(
                                    text: "Address",
                                    fontSize: 16,
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: TextView(
                                    text: "Address",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w600,
                                    alignment: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
