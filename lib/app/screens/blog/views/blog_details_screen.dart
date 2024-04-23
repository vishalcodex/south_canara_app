import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/blog_model.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Blog blog = Get.arguments?["blog"];
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorPallete.primary,
              ),
            ),
            title: const TextView(
              text: "Product Details", // translations.blogDetails.tr,
              color: ColorPallete.secondary,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      // controller.homeRefresh();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        blog.blogDetails == null
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0 * fem),
                                child: MyListView(
                                  children: [
                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                    const RoundedContainer(
                                      radius: 15,
                                      height: 175,
                                      clip: Clip.antiAliasWithSaveLayer,
                                      color: ColorPallete.disableGrey,
                                    ),
                                    SizedBox(
                                      height: 20 * fem,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextView(
                                            text: blog.blogName!,
                                            color: ColorPallete.grey,
                                            fontSize: 16,
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem),
                                          child: const TextView(
                                            text: "Price",
                                            color: ColorPallete.grey,
                                            fontSize: 14,
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                    TextView(
                                      text: "Company Name",
                                      color: ColorPallete.grey.withOpacity(0.5),
                                      fontSize: 16,
                                      weight: FontWeight.bold,
                                    ),

                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                    MyListView(
                                      children: [
                                        TextView(
                                          text: "Product Info",
                                          color: ColorPallete.grey
                                              .withOpacity(0.5),
                                          fontSize: 14,
                                          weight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  RoundedContainer(
                                                    radius: 5,
                                                    height: 10,
                                                    width: 100,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Html(
                                    //   data: blog.blogDetails!,
                                    //   style: {
                                    //     "body": Style(color: ColorPallete.secondary)
                                    //   },
                                    // ),
                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0 * fem),
                                child: MyListView(
                                  children: [
                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                    RoundedContainer(
                                      radius: 15,
                                      height: 175,
                                      clip: Clip.antiAliasWithSaveLayer,
                                      color: ColorPallete.disableGrey,
                                      child: Image.network(
                                        blog.filename!,
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20 * fem,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextView(
                                            text:
                                                blog.blogName ?? "Constitution",
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10 * fem,
                                    ),
                                    TextView(
                                      text: blog.blogDetails ??
                                          blog.shortDescription ??
                                          "",
                                      color: ColorPallete.secondary,
                                      fontSize: 14,
                                    ),
                                    // Html(
                                    //   data: blog.blogDetails!,
                                    //   style: {
                                    //     "body": Style(color: ColorPallete.secondary)
                                    //   },
                                    // ),
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
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 5,
                      color: ColorPallete.grey.withOpacity(0.5),
                    ),
                  ]),
                  child: RoundedContainer(
                    radius: 0,
                    color: ColorPallete.theme,
                    child: Padding(
                      padding: EdgeInsets.all(5.0 * fem),
                      child: Row(
                        children: [
                          Expanded(
                            child: RoundedContainer(
                              radius: 10,
                              color: ColorPallete.primary,
                              child: Padding(
                                padding: EdgeInsets.all(15.0 * fem),
                                child: const Center(
                                  child: TextView(
                                    text: "Subscribe Now",
                                    color: ColorPallete.theme,
                                    fontSize: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5 * fem,
                          ),
                          Expanded(
                            child: RoundedContainer(
                              radius: 10,
                              color: ColorPallete.primary,
                              child: Padding(
                                padding: EdgeInsets.all(15.0 * fem),
                                child: const Center(
                                  child: TextView(
                                    text: "Enquire Now",
                                    color: ColorPallete.theme,
                                    fontSize: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
