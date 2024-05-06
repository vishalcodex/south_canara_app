import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/template_controller.dart';

// ignore: must_be_immutable
class TemplatePreviewScreen extends GetView<TemplateController> {
  const TemplatePreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
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
          text: "Preview Of Theme",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                    child: MyListView(
                      children: [
                        _getNavBar(fem),
                        _getSliders(fem),
                        _getAboutUs(fem),
                        _getIntroduction(fem),
                        _getBusinessCategories(fem),
                        _getConnectUs(fem),
                        _getTestimonials(fem),
                        _getContactUs(fem),
                        SizedBox(
                          height: 25 * fem,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Select Theme Button
            Container(
              decoration: BoxDecoration(color: ColorPallete.theme, boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: ColorPallete.grey.withOpacity(0.5),
                ),
              ]),
              child: Padding(
                padding: EdgeInsets.all(10.0 * fem),
                child: InkWell(
                  onTap: () {
                    controller.onThemeSelected();
                  },
                  child: RoundedContainer(
                    radius: 10,
                    color: ColorPallete.primary,
                    child: Padding(
                      padding: EdgeInsets.all(15.0 * fem),
                      child: const Center(
                          child: TextView(
                        text: "Select Theme",
                        fontSize: 14,
                        weight: FontWeight.bold,
                        color: ColorPallete.theme,
                      )),
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

  _getNavBar(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: RoundedContainer(
        radius: 10,
        height: 50,
        color: ColorPallete.grey.withOpacity(0.2),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 5 * fem),
          child: Row(
            children: [
              RoundedContainer(
                radius: 10,
                color: ColorPallete.grey.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.all(10.0 * fem),
                  child: const TextView(
                    text: "Theme logo",
                    color: ColorPallete.secondary,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.menu,
                color: ColorPallete.secondary,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  _getSliders(double fem) {
    return Padding(
      padding: EdgeInsets.all(10.0 * fem),
      child: RoundedContainer(
          radius: 5,
          color: ColorPallete.grey.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.all(15.0 * fem),
            child: MyListView(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: const RoundedContainer(
                    radius: 10,
                    height: 175,
                    color: ColorPallete.grey,
                  ),
                ),
                SizedBox(
                  height: 5 * fem,
                ),
                Shimmer.fromColors(
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
              ],
            ),
          )),
    );
  }

  _getAboutUs(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "About Us",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10 * fem,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: const Center(
                child: TextView(
                  text:
                      "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios",
                  color: ColorPallete.secondary,
                  fontSize: 12,
                  alignment: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getIntroduction(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Introduction",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10 * fem,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: const Center(
                child: TextView(
                  text:
                      "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios",
                  color: ColorPallete.secondary,
                  fontSize: 12,
                  alignment: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBusinessCategories(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Business Categories",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10 * fem,
            ),
            MyListView(
              children: [1, 2].map((e) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RoundedContainer(
                    radius: 10,
                    color: ColorPallete.grey.withOpacity(0.2),
                    // height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(15.0 * fem),
                      child: MyListView(
                        children: [
                          RoundedContainer(
                            radius: 10,
                            height: 150,
                            color: ColorPallete.grey.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 20.0 * fem),
                            child: Row(
                              children: [
                                const Spacer(),
                                TextView(
                                  text: "Category $e",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  _getConnectUs(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Connect Us",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10 * fem,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: RoundedContainer(
                radius: 10,
                color: ColorPallete.primary,
                child: Padding(
                  padding: EdgeInsets.all(15.0 * fem),
                  child: const Center(
                    child: TextView(
                      text: "Call Now",
                      color: ColorPallete.theme,
                      fontSize: 14,
                      alignment: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getTestimonials(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Testimonials",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5 * fem,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.white,
              child: MyListView(
                children: [1].map((category) {
                  return RoundedContainer(
                    height: 150,
                    radius: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7.5 * fem,
                        ),
                        Expanded(
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
                                              horizontal: 3 * fem),
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAlias,
                                            width: 150 * fem,
                                            color: ColorPallete.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getContactUs(double fem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Contact Us",
                color: ColorPallete.secondary,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10 * fem,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2.5,
                          color: ColorPallete.grey.withOpacity(0.5),
                          offset: Offset(0, 5 * fem))
                    ]),
                child: RoundedContainer(
                  radius: 10,
                  color: ColorPallete.theme,
                  child: Padding(
                    padding: EdgeInsets.all(15.0 * fem),
                    child: MyListView(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextView(
                                text: "Address",
                                color: ColorPallete.secondary,
                              ),
                            ),
                            TextView(
                              text: " : ",
                              color: ColorPallete.secondary,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextView(
                                text:
                                    "E/303 Padman Nagar, Agashi Virar West, Pincode : 401301",
                                color: ColorPallete.secondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextView(
                                text: "Phone Number",
                                color: ColorPallete.secondary,
                              ),
                            ),
                            TextView(
                              text: " : ",
                              color: ColorPallete.secondary,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextView(
                                text: "+91-84591510732 / +91-9763996496",
                                color: ColorPallete.secondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextView(
                                text: "Contact Person Name",
                                color: ColorPallete.secondary,
                              ),
                            ),
                            TextView(
                              text: " : ",
                              color: ColorPallete.secondary,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextView(
                                text: "Testing Item",
                                color: ColorPallete.secondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15 * fem,
                        ),
                        const Center(
                          child: TextView(
                            text: "Like Us Of Facebook",
                            color: ColorPallete.primary,
                          ),
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        const Center(
                          child: TextView(
                            text: "Follow Us Of Instagram",
                            color: ColorPallete.red,
                          ),
                        ),
                        SizedBox(
                          height: 15 * fem,
                        ),
                        const Center(
                          child: TextView(
                            text: "Powered By Social Cardify - 2024-25",
                            color: ColorPallete.secondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
