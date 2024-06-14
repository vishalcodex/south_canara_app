import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:south_canara/app/components/ui/rounded_container.dart';
import '../../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/vendor.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/category_controller.dart';

// ignore: must_be_immutable
class SupplierDetailsScreen extends GetView<CategoryController> {
  const SupplierDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Vendor vendor = controller.selectedSupplier.value.vendorDetails!;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Supplier Details",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    MyListView(
                      children: [
                        SizedBox(
                          height: 25 * fem,
                        ),
                        Center(
                          child: RoundedContainer(
                            radius: 100 * fem,
                            height: 100 * fem,
                            width: 100 * fem,
                            borderColor: ColorPallete.primary,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: vendor.profileImage == null
                                  ? ""
                                  : Urls.getImageUrl(
                                      vendor.profileImage ?? "",
                                    ),
                              errorWidget: (context, url, error) {
                                return Icon(
                                  Icons.person,
                                  size: 50 * fem,
                                  color: ColorPallete.primary,
                                );
                              },
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15 * fem,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextView(
                              text: vendor.companyName!,
                              // controller
                              //     .user.value.accountName!.capitalize!,
                              fontSize: 18,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 5 * fem,
                              ),
                              EntryWidget(
                                title: "Contact Person's Name",
                                value: vendor.directorsName!,
                                icon: Icons.person,
                              ),
                              EntryWidget(
                                title: "Contact Number",
                                value: vendor.contactNumber!,
                                icon: Icons.phone,
                              ),
                              EntryWidget(
                                title: "Alternate Contact Number",
                                value: vendor.alternateContactNumber!,
                                icon: Icons.phone,
                              ),
                              EntryWidget(
                                title: "Email",
                                value: vendor.email!,
                                icon: Icons.alternate_email,
                              ),
                              EntryWidget(
                                title: "Address",
                                value:
                                    "${(vendor.address ?? "") == "" ? "" : "${vendor.address}"}${(vendor.city ?? "") == "" ? "" : ", ${vendor.city}"}${(vendor.state ?? "") == "" ? "" : ", ${vendor.state}"}${(vendor.country ?? "") == "" ? "" : ", ${vendor.country}"}",
                                icon: Icons.home,
                              ),
                              EntryWidget(
                                title: "Nature of Business",
                                value: vendor.natureOfBusiness!,
                                icon: Icons.business,
                              ),
                              EntryWidget(
                                title: "Leagal Status Of Firm",
                                value: vendor.legalStateOfFirm!,
                                icon: Icons.bookmark,
                              ),
                              EntryWidget(
                                title: "Year of Establisment",
                                value: vendor.yearOfEstablishment!,
                                icon: Icons.calendar_month,
                              ),
                              // EntryWidget(
                              //   title: "Bank Details",
                              //   value:
                              //       "Bank Name :\n${vendor.bankName}\n\nBank Acc No. :\n${vendor.bankAccountNumber}\n\nIFSC Code :\n${vendor.ifscCode}\n\nBeneficiary Name :\n${vendor.beneficiaryName}",
                              //   icon: Icons.payment,
                              // ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? icon;
  const EntryWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.50 * fem, horizontal: 10 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 12,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            RoundedContainer(
              radius: 10,
              color: ColorPallete.primary.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(10.0 * fem),
                child: Row(
                  children: [
                    Expanded(
                      child: TextView(
                        text: (value ?? "") == "" ? "NA" : value!,
                        color: ColorPallete.primary,
                        fontSize: 16,
                        // maxlines: 1,
                        // overflow: TextOverflow.ellipsis,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5 * fem),
                      child: Icon(
                        icon,
                        color: ColorPallete.primary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
