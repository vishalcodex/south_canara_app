import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/category_model.dart';
import '../../../models/location.dart';
import '../../../models/supplier_model.dart';
import '../../../providers/api_endpoints.dart';
import '../../../services/auth_service.dart';
import '../controllers/category_controller.dart';
import 'enquiry_alert.dart';

class SuppliersView extends GetView<CategoryController> {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.onCategorySelected(controller.selectedCategory.value);
      controller.scrollController.scrollTo(
          index:
              controller.categories.indexOf(controller.selectedCategory.value),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    });
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 5,
          ),
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
                SizedBox(
                  height: 5 * fem,
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
                      child: DropdownSearch<Location>(
                        selectedItem: controller.selectedLocation.value,
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          containerBuilder: (context, popupWidget) {
                            return Container(
                              color: ColorPallete.theme,
                              child: popupWidget,
                            );
                          },
                          itemBuilder: (context, item, isSelected) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0 * fem, vertical: 10 * fem),
                              child: TextView(
                                text: item.stateName!,
                                color: ColorPallete.secondary,
                                fontSize: 14,
                              ),
                            );
                          },
                          searchFieldProps: TextFieldProps(
                            style: TextStyle(
                                color: ColorPallete.primary,
                                fontSize: 12 * ffem),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15 * fem),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10 * fem)),
                              hintText: "Search Location ..",
                              hintStyle: TextStyle(
                                  color: ColorPallete.grey,
                                  fontSize: 12 * ffem),
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15 * fem),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                          ),
                          baseStyle: TextStyle(
                              color: ColorPallete.secondary,
                              fontSize: 10 * ffem),
                        ),
                        dropdownBuilder: (context, selectedItem) {
                          return TextView(
                            text: selectedItem?.stateName ?? "",
                            color: ColorPallete.primary,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          );
                        },
                        asyncItems: (String filter) => Future(() => controller
                            .locations
                            .where((p0) => p0.stateName!.startsWith(filter))
                            .toList()),
                        itemAsString: (Location u) => u.stateName!,
                        onChanged: (Location? value) =>
                            controller.onLoactionChanged(value!.stateName!),
                      ),
                    )
                  ],
                ),

                //Categories
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                  child: RoundedContainer(
                    radius: 0,
                    height: 30,
                    child: ScrollablePositionedList.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemScrollController: controller.scrollController,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        Category category =
                            controller.categories.elementAt(index);
                        bool isSelected = category.name ==
                            controller.selectedCategory.value.name;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
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
                      },
                    ),
                  ),
                ),
                //Sub Categories

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                  child: RoundedContainer(
                    radius: 0,
                    height: 30,
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
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.5 * fem),
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
            child: RefreshIndicator(
              onRefresh: () {
                controller.fetchSuppliers();
                return Future.value();
              },
              child: MyListView(
                scroll: true,
                children: controller.isLoading.value
                    ? [
                        const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      ]
                    : controller.suppliers.isEmpty
                        ? [
                            const SizedBox(
                              height: 200,
                              child: Center(
                                child: TextView(
                                  text: "No Suppliers Found !",
                                  color: ColorPallete.grey,
                                  fontSize: 22,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]
                        : controller.suppliers.map((supplier) {
                            return SupplierEntryWidget(supplier: supplier);
                          }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SupplierEntryWidget extends GetView<CategoryController> {
  final Supplier supplier;
  const SupplierEntryWidget({super.key, required this.supplier});

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
        child: InkWell(
          onTap: () {
            controller.onSupplierClicked(supplier);
          },
          child: RoundedContainer(
            radius: 10,
            height: MediaQuery.of(context).size.height * 0.2,
            color: ColorPallete.theme,
            child: Padding(
              padding: EdgeInsets.all(10.0 * fem),
              child: Row(
                children: [
                  RoundedContainer(
                    radius: 10,
                    width: MediaQuery.of(context).size.width / 4,
                    borderColor: ColorPallete.primary,
                    color: ColorPallete.grey.withOpacity(0.5),
                    clip: Clip.antiAliasWithSaveLayer,
                    child: RoundedContainer(
                      radius: 10,
                      clip: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: Urls.getImageUrl(supplier.productImage ?? ""),
                        height: 150 * fem,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Icon(
                            Icons.image_outlined,
                            size: 40 * fem,
                            color: ColorPallete.theme,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                      child: Column(
                        children: [
                          Expanded(
                            child: MyListView(
                              children: [
                                TextView(
                                  text: supplier.productName.toString(),
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                  weight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                TextView(
                                  text:
                                      "Supplier :${supplier.vendorDetails!.companyName}",
                                  color: ColorPallete.secondary,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                TextView(
                                  text: "Location: ${supplier.productOrigin}",
                                  color: ColorPallete.secondary,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                TextView(
                                  text: "Price : ₹${supplier.productPrice}",
                                  color: ColorPallete.secondary,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  controller.selectedSupplier.value = supplier;
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return const EnquiryDialog();
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
      ),
    );
  }
}
