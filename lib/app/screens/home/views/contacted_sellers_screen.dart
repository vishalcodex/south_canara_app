import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/contacted_seller_model.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class ContactedSellersScreen extends GetView<HomeController> {
  const ContactedSellersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.fetchMyEnquires();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Contacted Sellers",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    controller.fetchMyEnquires();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(() => controller.isLoading.value
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(10 * fem),
                                child: MyListView(
                                  children: [1, 2, 3].map((e) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0 * fem),
                                      child: InkWell(
                                        onTap: () {},
                                        child: RoundedContainer(
                                          radius: 10,
                                          height: 125,
                                          color: ColorPallete.grey
                                              .withOpacity(0.5),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0 * fem),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : controller.myEnquires.isEmpty
                              ? SizedBox(
                                  height: 200 * fem,
                                  child: const Center(
                                    child: TextView(
                                      text: "No Enquires!",
                                      fontSize: 24,
                                      weight: FontWeight.bold,
                                      color: ColorPallete.grey,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: MyListView(
                                    children:
                                        controller.myEnquires.map((enquiry) {
                                      return EnquiryWidget(
                                        seller: enquiry,
                                      );
                                    }).toList(),
                                  ),
                                ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EnquiryWidget extends StatelessWidget {
  final ContactedSeller seller;
  const EnquiryWidget({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 2.5,
              blurRadius: 10,
              color: ColorPallete.grey.withOpacity(0.5),
              offset: const Offset(5, 5))
        ]),
        child: RoundedContainer(
          radius: 10,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(10 * fem),
            child: Center(
              child: MyListView(
                children: [
                  EntryWidget(
                    title: "For product",
                    value: seller.productId.toString(),
                  ),
                  EntryWidget(
                    title: "Seller",
                    value: seller.vendor!.companyName.toString(),
                  ),
                  EntryWidget(
                    title: "Enquired Quantity",
                    value: seller.quantity.toString(),
                  ),
                  EntryWidget(
                    title: "Enquired on Date",
                    value: DateFormat("dd MMM yyyy hh:mm a").format(
                        DateFormat("yyyy-MM-ddTHH:mm:ss")
                            .parse(seller.createdAt!)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 * fem, vertical: 5 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedContainer(
            radius: 0,
            child: TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
            child: const TextView(
              text: ":",
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          ),
          RoundedContainer(
            radius: 0,
            child: TextView(
              text: value ?? "",
              color: ColorPallete.secondary,
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
