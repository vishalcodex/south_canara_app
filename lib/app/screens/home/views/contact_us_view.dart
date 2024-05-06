import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class ContactUsView extends GetView<HomeController> {
  const ContactUsView({Key? key}) : super(key: key);
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
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
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
                          padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 10 * fem,
                              ),
                              RoundedContainer(
                                radius: 10,
                                height: 150,
                                width: 150,
                                color: ColorPallete.disableGrey,
                                borderColor: ColorPallete.primary,
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              TextView(
                                text: "Company Name",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                                alignment: TextAlign.justify,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const RoundedContainer(
                                radius: 0,
                                child: TextView(
                                  text:
                                      "     Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\n\n Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC.",
                                  color: ColorPallete.secondary,
                                  fontSize: 12,
                                  alignment: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              TextView(
                                text: "Customer Care Number",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                                alignment: TextAlign.justify,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              RoundedContainer(
                                radius: 10,
                                color: ColorPallete.primary,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0 * fem),
                                  child: Center(
                                    child: TextView(
                                      text: "Call Custommer Care",
                                      color: ColorPallete.theme,
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              TextView(
                                text: "Social Media Links",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                                alignment: TextAlign.justify,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              RoundedContainer(
                                radius: 10,
                                color: ColorPallete.primary,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0 * fem),
                                  child: Center(
                                    child: TextView(
                                      text: "Go to Facebook",
                                      color: ColorPallete.theme,
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              RoundedContainer(
                                radius: 10,
                                color: ColorPallete.primary,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0 * fem),
                                  child: Center(
                                    child: TextView(
                                      text: "Follow us on Instagram",
                                      color: ColorPallete.theme,
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              TextView(
                                text: "Address",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                                alignment: TextAlign.justify,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              TextView(
                                text:
                                    " This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some? There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                                fontSize: 12,
                                color: ColorPallete.secondary,
                                alignment: TextAlign.justify,
                              )
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
}
