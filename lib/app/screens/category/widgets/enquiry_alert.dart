import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/components/ui/my_list_view.dart';
import 'package:south_canara/app/components/ui/rounded_container.dart';
import 'package:south_canara/app/components/ui/text_field.dart';
import 'package:south_canara/app/components/ui/text_view.dart';
import 'package:south_canara/common/color_pallete.dart';

class EnquiryDialog extends StatelessWidget {
  const EnquiryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20.0 * fem),
        child: MyListView(
          children: [
            const Center(
              child: TextView(
                text: "Enquire Now",
                color: ColorPallete.secondary,
                fontSize: 14,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20 * fem,
            ),
            const TextView(
              text: "Required Quantity",
              color: ColorPallete.secondary,
              fontSize: 12,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            RoundedContainer(
              radius: 10,
              color: ColorPallete.grey.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0 * fem,
                ),
                child: MyTextField(
                  hintText: "Quantity",
                  fontSize: 14,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 15 * fem,
            ),
            const TextView(
              text: "Location",
              color: ColorPallete.secondary,
              fontSize: 12,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            RoundedContainer(
              radius: 10,
              color: ColorPallete.grey.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0 * fem,
                ),
                child: MyTextField(
                  hintText: "Location",
                  hintColor: ColorPallete.grey,
                  fontSize: 14,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 20 * fem,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: RoundedContainer(
                radius: 10,
                color: ColorPallete.primary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextView(
                      text: "Submit",
                      color: ColorPallete.theme,
                      fontSize: 14,
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
