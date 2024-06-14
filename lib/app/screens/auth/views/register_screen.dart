import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controller/auth_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorPallete.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: RoundedContainer(
                                radius: 20,
                                clip: Clip.antiAliasWithSaveLayer,
                                color: ColorPallete.theme,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MyListView(
                                    scroll: true,
                                    // mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: TextView(
                                          text: translations.appName.tr,
                                          fontSize: 22,
                                          weight: FontWeight.w700,
                                          color: ColorPallete.secondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Center(
                                        child: TextView(
                                          text: translations.registration.tr,
                                          fontSize: 18,
                                          weight: FontWeight.w500,
                                          color: ColorPallete.secondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Obx(
                                        () => MyListView(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: ["Customer", "Vendor"]
                                            //       .map((e) {
                                            //     bool isSelected =
                                            //         e == "Customer" &&
                                            //                 controller
                                            //                     .isCustomer
                                            //                     .value ||
                                            //             e == "Vendor" &&
                                            //                 !controller
                                            //                     .isCustomer
                                            //                     .value;
                                            //     return Padding(
                                            //       padding: const EdgeInsets
                                            //           .symmetric(
                                            //           horizontal: 10.0),
                                            //       child: InkWell(
                                            //         onTap: () {
                                            //           controller.isCustomer
                                            //                   .value =
                                            //               e == "Customer";
                                            //           controller.isCustomer
                                            //               .refresh();
                                            //         },
                                            //         child: RoundedContainer(
                                            //           radius: 10,
                                            //           // color:
                                            //           //     ColorPallete.primary,
                                            //           child: Padding(
                                            //             padding:
                                            //                 const EdgeInsets
                                            //                     .all(10.0),
                                            //             child: Center(
                                            //               child: Row(
                                            //                 children: [
                                            //                   Padding(
                                            //                     padding: const EdgeInsets
                                            //                         .symmetric(
                                            //                         horizontal:
                                            //                             10.0),
                                            //                     child: Icon(
                                            //                       isSelected
                                            //                           ? Icons
                                            //                               .radio_button_checked
                                            //                           : Icons
                                            //                               .radio_button_off_outlined,
                                            //                       color: ColorPallete
                                            //                           .primary,
                                            //                     ),
                                            //                   ),
                                            //                   TextView(
                                            //                     text: e,
                                            //                     color:
                                            //                         ColorPallete
                                            //                             .primary,
                                            //                     fontSize: 14,
                                            //                   ),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   }).toList(),
                                            // ),
                                            // const SizedBox(
                                            //   height: 15,
                                            // ),
                                            TextFormField(
                                              cursorColor:
                                                  ColorPallete.secondary,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    translations.fullName.tr,
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter you Name';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds["name"] =
                                                    value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              readOnly: (controller.user.value
                                                          .phoneNumber ??
                                                      "") !=
                                                  "",
                                              initialValue: controller
                                                  .user.value.phoneNumber,
                                              cursorColor:
                                                  ColorPallete.secondary,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    translations.phoneNumber.tr,
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter text';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.user.value
                                                    .phoneNumber = value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              cursorColor:
                                                  ColorPallete.secondary,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    translations.email.tr,
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter text';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds["email"] =
                                                    value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              cursorColor:
                                                  ColorPallete.secondary,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText: "Location",
                                                // translations.email.tr,
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your email';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds["location"] =
                                                    value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              obscureText:
                                                  controller.showPassword.value,
                                              cursorColor:
                                                  ColorPallete.secondary,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    translations.password.tr,
                                                suffixIcon: IconButton(
                                                    icon: Icon(
                                                      !controller.showPassword
                                                              .value
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off,
                                                    ),
                                                    onPressed: () {
                                                      controller.showPassword
                                                              .value =
                                                          !controller
                                                              .showPassword
                                                              .value;
                                                    }),
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorPallete
                                                          .secondary),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter text';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds["password"] =
                                                    value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            controller.errorMessage.value == ""
                                                ? SizedBox.shrink()
                                                : TextView(
                                                    text: controller
                                                        .errorMessage.value,
                                                    fontSize: 14,
                                                    color: Colors.red,
                                                  ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    if (!controller
                                                        .isLoading.value) {
                                                      controller.register();
                                                    }
                                                  },
                                                  // inkwell color
                                                  child: RoundedContainer(
                                                    radius: 60,
                                                    color: ColorPallete.primary,
                                                    child: SizedBox(
                                                      width: 56,
                                                      height: 56,
                                                      child: controller
                                                              .isLoading.value
                                                          ? const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor: AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    ColorPallete
                                                                        .theme),
                                                                strokeWidth:
                                                                    5.0,
                                                              ),
                                                            )
                                                          : const Icon(
                                                              // Add this
                                                              Icons
                                                                  .arrow_forward,
                                                              // Add this
                                                              color:
                                                                  Colors.white,

                                                              size: 30,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    color: ColorPallete.secondary,
                                    fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: ColorPallete.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorPallete.primary;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.10);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
