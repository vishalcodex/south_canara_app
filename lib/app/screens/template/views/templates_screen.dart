import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/template_controller.dart';

// ignore: must_be_immutable
class TemplatesScreen extends GetView<TemplateController> {
  const TemplatesScreen({Key? key}) : super(key: key);

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
        title: TextView(
          text: "Theme",
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
                    padding: EdgeInsets.all(10.0 * fem),
                    child: MyListView(
                      children: controller.themes.map((element) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0 * fem, horizontal: 10 * fem),
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
                            child: InkWell(
                              onTap: () {
                                controller.toPreviewSelectedTheme(element);
                              },
                              child: RoundedContainer(
                                radius: 10,
                                color: ColorPallete.theme,
                                borderColor: ColorPallete.grey.withOpacity(0.2),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0 * fem),
                                  child: MyListView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0 * fem),
                                        child: TextView(
                                          text: element["name"],
                                          fontSize: 16,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 150,
                                              child: RoundedContainer(
                                                radius: 10,
                                                color: ColorPallete.grey
                                                    .withOpacity(0.25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10 * fem,
                                          ),
                                          const CircleAvatar(
                                            backgroundColor:
                                                ColorPallete.primary,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: ColorPallete.theme,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
