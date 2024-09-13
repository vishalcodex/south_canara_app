import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class AboutUsView extends GetView<HomeController> {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
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
            title: const TextView(
              text: "About Us",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorPallete.primary,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * fem, vertical: 20 * fem),
                      child: RoundedContainer(
                        radius: 10,
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: MyListView(
                            scroll: true,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/ui/logo.png",
                                  height: 75,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // const Center(
                              //   child: TextView(
                              //     text: "South Canara",
                              //     fontSize: 20,
                              //     color: ColorPallete.primary,
                              //     weight: FontWeight.bold,
                              //   ),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: TextView(
                                  text: "All Rights Reserved.",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: TextView(
                                  text: "Version 1.0.0 v1",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextView(
                                      text: "Contact Us :",
                                      fontSize: 14,
                                      color: ColorPallete.secondary,
                                      weight: FontWeight.w400,
                                    ),
                                    TextView(
                                      text: "info@southcanara.com",
                                      fontSize: 14,
                                      color: ColorPallete.primary,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextView(
                                      text: "Website :",
                                      fontSize: 14,
                                      color: ColorPallete.secondary,
                                      weight: FontWeight.w400,
                                    ),
                                    TextView(
                                      text: "https://southcanara.com",
                                      fontSize: 14,
                                      color: ColorPallete.primary,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // const Center(
                              //   child: TextView(
                              //     text: "Address",
                              //     fontSize: 16,
                              //     color: ColorPallete.secondary,
                              //     weight: FontWeight.w500,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // const Center(
                              //   child: TextView(
                              //     text: "Address",
                              //     fontSize: 14,
                              //     color: ColorPallete.secondary,
                              //     weight: FontWeight.w600,
                              //     alignment: TextAlign.center,
                              //   ),
                              // )
                              const Center(
                                child: TextView(
                                  text:
                                      "### Welcome to South Canara Agro Mart\n\n\nAt South Canara Agro Mart, we pride ourselves on being a premier platform connecting buyers and sellers of high-quality dry fruits and spices. \n\n\n### Who We Are\n\n\nSouth Canara Agro Mart is a leading supplier and broker of Cashew Kernels, Raw Cashew Nuts, and Spices. Our roots are deeply embedded in the vibrant agro-industrial community of Mangalore. We aim to revolutionize the way dry fruits and spices are traded by providing a seamless, efficient, and transparent marketplace for both buyers and sellers.\n\n\n### Our Vision\n\n\nTo be the preferred and trusted partner in the supply of high-quality agro products, fostering sustainable and eco-friendly practices. We are committed to serving our customers with nutritious and healthy products across India and the world, innovating continuously to meet the needs of a dynamic market.\n\n\n### Our Mission\n\n\n- *Quality Products at Reasonable Prices*: Ensuring our customers receive the best value without compromising on quality.\n- *Building Strong Relationships*: Creating lasting connections between our organization and customers through trust and reliability.\n- *Transparency in Business*: Educating our customers with clear, factual information and maintaining transparency in all business dealings.\n\n\n### What We Offer\n\n\n#### High-Quality Products\n- *Cashew Kernels*: Fresh, crunchy, and sourced from the best farms.\n- *Raw Cashew Nuts*: High-grade nuts ready for processing.\n- *Spices*: A wide variety of spices to add flavor and health benefits to your cuisine.\n\n\n#### Seamless Buyer-Seller Interaction\n\n- *Easy Listings*: Sellers can effortlessly list their products with high-quality images and detailed descriptions.\n- *Direct Communication*: Buyers and sellers can connect directly through our integrated messaging system.\n\n\n### Our Commitment to Quality\n\n\nQuality is at the heart of everything we do. We work closely with our suppliers to ensure that every product meets our stringent quality standards. Our quality control processes are designed to guarantee that our customers receive only the best.\n\n\nJoin Us Today\n\n\nWhether you are a seller looking to expand your market reach or a buyer seeking the best agro products, South Canara Agro Mart is your ideal partner. Join our growing community and experience the difference of trading with a trusted, innovative platform.\n\n\nContact Us\n\n\nFor more details or business inquiries, please feel free to contact us.\n\n\n*South Canara Sales Corporation*  \nEmail: southcanarasalescorp@gmail.com  \nWhatsApp/Mobile: +91 63646 78930 /\n+917338389310",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
