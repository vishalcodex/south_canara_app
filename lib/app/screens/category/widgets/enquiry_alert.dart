import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/category_controller.dart';

class EnquiryDialog extends GetView<CategoryController> {
  const EnquiryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Obx(
        () => Padding(
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
              TextView(
                text:
                    "MOQ : ${controller.selectedSupplier.value.productMoq} in ${controller.selectedSupplier.value.productUnit}",
                color: ColorPallete.grey,
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
                    onChanged: (value) {
                      controller.quantity.value = double.parse(value);
                    },
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
                    onChanged: (value) {
                      controller.location.value = value;
                    },
                  ),
                ),
              ),
              if (controller.error.value != "")
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextView(
                    text: controller.error.value,
                    color: ColorPallete.red,
                    fontSize: 12,
                  ),
                ),
              SizedBox(
                height: 20 * fem,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.error.value = "";
                        Get.back();
                      },
                      child: const RoundedContainer(
                        radius: 10,
                        height: 45,
                        color: ColorPallete.theme,
                        borderColor: ColorPallete.primary,
                        child: Center(
                          child: TextView(
                            text: "Close",
                            color: ColorPallete.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (controller.quantity.value <= 20000 &&
                            controller.quantity.value >=
                                controller.selectedSupplier.value.productMoq! &&
                            controller.location.value != "") {
                          controller.error.value = "";
                          controller.sendEnquiry();
                        } else {
                          controller.error.value = controller.location.value ==
                                  ""
                              ? "Location cannot be empty."
                              : "Qty should be between  ${controller.selectedSupplier.value.productMoq} - 20000 ${controller.selectedSupplier.value.productUnit} ";
                        }
                      },
                      child: const RoundedContainer(
                        radius: 10,
                        height: 45,
                        color: ColorPallete.primary,
                        child: Center(
                          child: TextView(
                            text: "Submit",
                            color: ColorPallete.theme,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
