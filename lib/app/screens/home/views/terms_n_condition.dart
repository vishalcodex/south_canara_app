import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class TermsAndCondtionsScreen extends GetView<HomeController> {
  const TermsAndCondtionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
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
              text: "Terms & Condtions",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.homeRefresh();
                      return Future.value();
                    },
                    child: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {
                              // Update loading bar.
                            },
                            onPageStarted: (String url) {},
                            onPageFinished: (String url) {},
                            onWebResourceError: (WebResourceError error) {},
                            onNavigationRequest: (NavigationRequest request) {
                              if (request.url
                                  .startsWith('https://www.youtube.com/')) {
                                return NavigationDecision.prevent;
                              }
                              return NavigationDecision.navigate;
                            },
                          ),
                        )
                        ..loadRequest(
                            Uri.parse("${Urls.baseUrl}?terms_n_condition")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
