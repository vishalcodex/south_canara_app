import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/vendor_controller.dart';

// ignore: must_be_immutable
class VendorScreen extends GetView<VendorController> {
  const VendorScreen({Key? key}) : super(key: key);

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
          // appBar: AppBar(
          //   iconTheme: const IconThemeData(color: ColorPallete.theme),
          //   backgroundColor: ColorPallete.primary,
          //   // leading: InkWell(
          //   //   onTap: () {
          //   //     controller.scaffoldKey.currentState!.openDrawer();
          //   //   },
          //   //   child: const Icon(
          //   //     Icons.menu,
          //   //     color: ColorPallete.primary,
          //   //   ),
          //   // ),
          //   title: const TextView(
          //     text: "Buyer / Seller",
          //     color: ColorPallete.theme,
          //     fontSize: 18,
          //     weight: FontWeight.bold,
          //   ),
          //   actions: [],
          // ),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    controller.fetchCounts();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(
                        () => controller.tabs.isEmpty
                            ? const SizedBox(
                                height: 200,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: ColorPallete.primary,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.all(10.0 * fem),
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  children: controller.tabs.map((vendorTab) {
                                    return Padding(
                                      padding: EdgeInsets.all(5.0 * fem),
                                      child: Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2.5,
                                              blurRadius: 10,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(5, 5))
                                        ]),
                                        child: InkWell(
                                          onTap: () {
                                            controller.launchTab(vendorTab);
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            color: ColorPallete.theme,
                                            child: Center(
                                              child: TextView(
                                                text:
                                                    "${vendorTab.label}${(vendorTab.total ?? 0) > 0 ? "\n(${vendorTab.total})" : ""}",
                                                color: ColorPallete.primary,
                                                fontSize: 14,
                                                weight: FontWeight.w700,
                                                alignment: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          drawer: CustomDrawer(),
        ),
      ),
    );
  }
}
