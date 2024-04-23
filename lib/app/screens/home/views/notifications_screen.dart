import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/components/ui/rounded_container.dart';
import 'package:south_canara/app/components/ui/text_view.dart';
import 'package:south_canara/common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/home_controller.dart';

class NotificationView extends GetView<HomeController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0 * fem, vertical: 5 * fem),
      child: MyListView(
        scroll: true,
        children: [
          MyListView(
            children: [1, 2, 3, 4].map((e) {
              return NotificationTile();
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0 * fem, horizontal: 10 * fem),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: ColorPallete.grey.withOpacity(0.5),
            offset: Offset(5, 5),
          )
        ]),
        child: RoundedContainer(
          radius: 10,
          height: 100,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(10.0 * fem),
            child: MyListView(
              children: [
                TextView(
                  text: "Notification Tile",
                  fontSize: 14,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                TextView(
                  text:
                      " Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\n\n Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC.\n\n   This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some? There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,",
                  fontSize: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
