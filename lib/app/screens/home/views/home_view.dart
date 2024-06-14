import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/slide_model.dart';
import '../../../routes/app_routes.dart';
import '../../category/widgets/category_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50.0 * fem),
          //     child: CustomHomeAppBar(
          //       drawerContext: context,
          //       pageName: "",
          //     )),
          body: Obx(
            () => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.homeRefresh();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 15 * fem,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _getSliders(controller, fem),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const CategoriesView(
                                inHomeView: true,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const TextView(
                                text: "Blogs",
                                color: ColorPallete.secondary,
                                fontSize: 16,
                                weight: FontWeight.bold,
                              ),
                              _buildCategories(controller, fem, context),
                              SizedBox(
                                height: 10 * fem,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getSliders(HomeController controller, double fem) {
    return Obx(
      () => MyListView(
        children: [
          // TextView(
          //   text: translations.impUpdates.tr,
          //   color: ColorPallete.secondary,
          //   fontSize: 14,
          //   weight: FontWeight.bold,
          // ),
          // SizedBox(
          //   height: 10 * fem,
          // ),
          controller.sliders.isEmpty
              ? InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.ADVERTISEMENT,
                      arguments: Slide(
                          sliderName: "Slider Title",
                          sliderDescription: "Slider Description"),
                    );
                  },
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.white,
                    child: const RoundedContainer(
                      radius: 10,
                      height: 175,
                      color: ColorPallete.grey,
                    ),
                  ),
                )
              : RoundedContainer(
                  radius: 0,
                  height: 175,
                  child: PageView.builder(
                    controller: controller.sliderPageController,
                    onPageChanged: (value) {
                      controller.selectedSlide.value =
                          (value % controller.sliders.length);
                      controller.selectedSlide.refresh();
                    },
                    itemBuilder: (context, index) {
                      int pos = index % controller.sliders.length;
                      Slide slide = controller.sliders.elementAt(pos);
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ADVERTISEMENT, arguments: slide);
                        },
                        child: RoundedContainer(
                          radius: 10,
                          clip: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.5 * fem,
                                  blurRadius: 5 * fem,
                                  offset: Offset(0, 0 * fem),
                                  color: ColorPallete.grey.withOpacity(0.1))
                            ]),
                            child: CachedNetworkImage(
                              imageUrl: slide.sliderImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          SizedBox(
            height: 5 * fem,
          ),
          controller.selectedSlide.value == -1
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: RoundedContainer(
                    radius: 0,
                    height: 7.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [1, 2, 3].map((element) {
                        bool isSelected = element == 1;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                          child: RoundedContainer(
                            color: isSelected
                                ? ColorPallete.grey
                                : ColorPallete.grey.withOpacity(0.5),
                            radius: 5,
                            height: 10,
                            width: isSelected ? 20 : 10,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.sliders.length,
                      itemBuilder: (context, index) {
                        bool isSelected =
                            index == controller.selectedSlide.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                          child: RoundedContainer(
                            color: isSelected
                                ? ColorPallete.primary
                                : ColorPallete.grey.withOpacity(0.5),
                            radius: 5,
                            height: 10,
                            width: isSelected ? 20 : 10,
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _buildCategories(
      HomeController controller, double fem, BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.BLOG_DETAILS,
        //     arguments: {"blog": Blog(blogName: "Product Name")});
      },
      child: MyListView(
        children: [
          // TextView(
          //   text: "Why Social Cardify ?",
          //   fontSize: 16,
          //   color: ColorPallete.secondary,
          //   weight: FontWeight.bold,
          // ),
          controller.blogs.isEmpty
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10 * fem),
                    child: RoundedContainer(
                      height: 175,
                      // color: ColorPallete.grey,
                      radius: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MyListView(
                              isRow: true,
                              scroll: true,
                              children: [1, 2, 3]
                                  .map(
                                    (blog) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10 * fem, vertical: 15),
                                      child: Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: ColorPallete.grey
                                                  .withOpacity(0.25),
                                              blurRadius: 15,
                                              spreadRadius: 5)
                                        ]),
                                        child: RoundedContainer(
                                          radius: 10,
                                          clip: Clip.antiAlias,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          color: ColorPallete.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 185 * fem,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyListView(
                            isRow: true,
                            scroll: true,
                            children: controller.blogs
                                .map(
                                  (blog) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.5 * fem, vertical: 15),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: ColorPallete.grey
                                                .withOpacity(0.25),
                                            blurRadius: 15,
                                            spreadRadius: 5)
                                      ]),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.BLOG_DETAILS,
                                              arguments: {"blog": blog});
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          clip: Clip.antiAlias,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2 *
                                              fem,
                                          color: ColorPallete.theme,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: MyListView(
                                              children: [
                                                RoundedContainer(
                                                  radius: 10,
                                                  height: 100 * fem,
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.25),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: TextView(
                                                              text: blog
                                                                  .blogName
                                                                  .toString(),
                                                              fontSize: 14,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxlines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          TextView(
                                                            text: blog
                                                                .blogDetails
                                                                .toString(),
                                                            fontSize: 12,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxlines: 1,
                                                            color: ColorPallete
                                                                .secondary,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
