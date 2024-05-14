import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/components/ui/form_fields.dart';
import 'package:south_canara/app/screens/category/widgets/enquiry_alert.dart';
import 'package:south_canara/app/services/auth_service.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/category_controller.dart';

class SuppliersView extends GetView<CategoryController> {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0 * fem,
      ),
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: MyListView(
                children: [
                  TextView(
                    text:
                        "Hello, ${Get.find<AuthService>().user.value.name!.split(" ").first}",
                    fontSize: 14,
                    color: ColorPallete.secondary,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.location_searching,
                          color: ColorPallete.secondary,
                        ),
                      ),
                      Expanded(
                        child: MyFormField(
                          fieldName: "Location",
                          type: InputType.DROP_DOWN,
                          keyboard: TextInputType.none,
                          dropDownOptions: controller.locations
                              .map((element) => element.stateName)
                              .toList(),
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  //Categories
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                    child: RoundedContainer(
                      radius: 0,
                      height: 40,
                      child: MyListView(
                          isRow: true,
                          scroll: true,
                          children: controller.categories.map((category) {
                            bool isSelected = category.name ==
                                controller.selectedCategory.value.name;
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 2.5 * fem),
                              child: InkWell(
                                onTap: () {
                                  controller.onCategorySelected(category);
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  borderColor: ColorPallete.primary,
                                  color: isSelected
                                      ? ColorPallete.primary
                                      : ColorPallete.theme,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15 * fem,
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: category.name ?? "",
                                        fontSize: 14,
                                        color: isSelected
                                            ? ColorPallete.theme
                                            : ColorPallete.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                  //Sub Categories

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                    child: RoundedContainer(
                      radius: 0,
                      height: 40,
                      child: controller.subCategories.isEmpty
                          ? RoundedContainer(
                              radius: 0,
                              child: Center(
                                child: TextView(
                                  text: "No sub sategories present",
                                  color: ColorPallete.grey.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : MyListView(
                              isRow: true,
                              scroll: true,
                              children:
                                  controller.subCategories.map((subcategory) {
                                bool isSelected = subcategory.name ==
                                    controller.selectedSubCategory.value.name;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.5 * fem),
                                  child: InkWell(
                                    onTap: () {
                                      controller
                                          .onSubCategorySelected(subcategory);
                                    },
                                    child: RoundedContainer(
                                      radius: 10,
                                      borderColor: ColorPallete.primary,
                                      color: isSelected
                                          ? ColorPallete.primary
                                          : ColorPallete.theme,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15 * fem,
                                        ),
                                        child: Center(
                                          child: TextView(
                                            text: subcategory.name ?? "",
                                            fontSize: 14,
                                            color: isSelected
                                                ? ColorPallete.theme
                                                : ColorPallete.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList()),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: MyListView(
                scroll: true,
                children: [1, 2, 3, 4, 5].map((element) {
                  return SupplierEntryWidget();
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SupplierEntryWidget extends StatelessWidget {
  const SupplierEntryWidget({super.key});

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
          height: 125,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(10.0 * fem),
            child: Row(
              children: [
                RoundedContainer(
                  radius: 10,
                  width: MediaQuery.of(context).size.width / 4,
                  color: ColorPallete.grey.withOpacity(0.5),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                    child: MyListView(
                      children: [
                        TextView(
                          text: "Product Name",
                          color: ColorPallete.secondary,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        TextView(
                          text: "Supplier Name",
                          color: ColorPallete.secondary,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        TextView(
                          text: "Location",
                          color: ColorPallete.secondary,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        TextView(
                          text: "Price",
                          color: ColorPallete.secondary,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return EnquiryDialog();
                                  },
                                );
                              },
                              child: RoundedContainer(
                                radius: 10,
                                color: ColorPallete.primary,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.50 * fem,
                                      horizontal: 15 * fem),
                                  child: const Center(
                                    child: TextView(
                                      text: "Enquire Now",
                                      color: ColorPallete.theme,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
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
