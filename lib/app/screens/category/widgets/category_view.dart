import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/components/ui/rounded_container.dart';
import 'package:south_canara/app/screens/home/controllers/home_controller.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/category_controller.dart';

class CategoriesView extends GetView<CategoryController> {
  final bool inHomeView;
  const CategoriesView({
    super.key,
    required this.inHomeView,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0 * fem, horizontal: 10 * fem),
      child: Obx(
        () => MyListView(
          children: [
            const TextView(
              text: "What are you looking for ?",
              fontSize: 16,
              color: ColorPallete.secondary,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
              child: controller.selectedCategory["name"] != null
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.categories.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5 * fem,
                          crossAxisSpacing: 5 * fem),
                      itemBuilder: (context, index) {
                        var cat;
                        bool isSelected = false;
                        if (index != controller.categories.length) {
                          cat = controller.categories.elementAt(index);
                          isSelected = cat["name"] ==
                              controller.selectedCategory["name"];
                        }

                        return index == controller.categories.length
                            ? RoundedContainer(
                                radius: 10,
                                color: ColorPallete.grey.withOpacity(0.25),
                                height: MediaQuery.of(context).size.width / 5,
                                child: const Center(
                                  child: TextView(
                                    text: "See More",
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  controller.selectedCategory.value = cat;
                                  controller.selectedCategory.refresh();
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  color: isSelected
                                      ? ColorPallete.primary
                                      : ColorPallete.grey.withOpacity(0.25),
                                  height: MediaQuery.of(context).size.width / 5,
                                  child: Center(
                                    child: TextView(
                                      text: cat["name"],
                                      color: isSelected
                                          ? ColorPallete.theme
                                          : ColorPallete.secondary,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              );
                      },
                    )
                  : SizedBox.shrink(),
            ),
            // const TextView(
            //   text: "Please select your state",
            //   fontSize: 16,
            //   color: ColorPallete.secondary,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
            //   child: RoundedContainer(
            //     radius: 10,
            //     borderColor: ColorPallete.grey,
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButtonFormField(
            //           decoration:
            //               const InputDecoration(border: InputBorder.none),
            //           value: controller.selectedLocation.value,
            //           items: controller.locations
            //               .map((element) => DropdownMenuItem<String>(
            //                   value: element["name"],
            //                   child: TextView(text: element["name"])))
            //               .toList(),
            //           onChanged: (value) {},
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 10 * fem,
            ),
            InkWell(
              onTap: () {
                if (inHomeView) {
                  Get.find<HomeController>().setTabIndex.value = 1;
                }
                controller.searchSuppliers();
              },
              child: RoundedContainer(
                radius: 10,
                color: ColorPallete.primary,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
                  child: const Center(
                    child: TextView(
                      text: "Lets find Suppliers",
                      fontSize: 14,
                      color: ColorPallete.theme,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
