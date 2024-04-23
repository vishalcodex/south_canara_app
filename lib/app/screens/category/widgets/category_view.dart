import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/category_model.dart';
import '../../home/controllers/home_controller.dart';
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
              child: controller.selectedCategory.value.name == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.white,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem),
                        itemBuilder: (context, index) {
                          // bool isSelected = false;
                          // Category cat = controller.categories.elementAt(
                          //     index < controller.categories.length
                          //         ? index
                          //         : controller.categories.length - 1);
                          // isSelected =
                          //     cat.name == controller.selectedCategory.value.name;

                          return InkWell(
                            onTap: () {},
                            child: RoundedContainer(
                              radius: 10,
                              clip: Clip.antiAliasWithSaveLayer,
                              height: MediaQuery.of(context).size.width / 5,
                              child: Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: RoundedContainer(
                                  radius: 7.5,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  color: ColorPallete.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.categories.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5 * fem,
                          crossAxisSpacing: 5 * fem),
                      itemBuilder: (context, index) {
                        bool isSelected = false;
                        Category cat = controller.categories.elementAt(
                            index < controller.categories.length
                                ? index
                                : controller.categories.length - 1);
                        isSelected =
                            cat.name == controller.selectedCategory.value.name;

                        return index == controller.categories.length
                            ? InkWell(
                                onTap: () {
                                  Get.find<HomeController>().setTabIndex.value =
                                      1;
                                },
                                child: RoundedContainer(
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
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  controller.selectedCategory.value = cat;
                                  controller.selectedCategory.refresh();
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  borderColor:
                                      isSelected ? ColorPallete.primary : null,
                                  height: MediaQuery.of(context).size.width / 5,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.5),
                                        child: RoundedContainer(
                                          radius: 7.5,
                                          clip: Clip.antiAliasWithSaveLayer,
                                          child: CachedNetworkImage(
                                            imageUrl: cat.image ?? "",
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) {
                                              return RoundedContainer(
                                                radius: 0,
                                                color: isSelected
                                                    ? ColorPallete.primary
                                                        .withOpacity(0.5)
                                                    : ColorPallete.grey
                                                        .withOpacity(0.25),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                spreadRadius: 2,
                                                color: isSelected
                                                    ? ColorPallete.theme
                                                        .withOpacity(0.95)
                                                    : ColorPallete.themeContrast
                                                        .withOpacity(0.75))
                                          ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: TextView(
                                              text: cat.name ?? "",
                                              color: isSelected
                                                  ? ColorPallete.primary
                                                  : ColorPallete.theme,
                                              weight: FontWeight.bold,
                                              // fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
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
