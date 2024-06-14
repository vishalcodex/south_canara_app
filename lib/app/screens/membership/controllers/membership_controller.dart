import 'dart:io';

import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../../services/auth_service.dart';
import '../widgets/membership_card.dart';

class MembershipController extends GetxController {
  // late MembershipRepository _membershipRepository;
  MembershipController() {
    // _membershipRepository = MembershipRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {}

  RxBool isLoading = false.obs;
  WidgetsToImageController frontCardController = WidgetsToImageController();
  void downloadMembershipCard() async {
    isLoading.value = true;
    return frontCardController.capture().then((value) async {
      pw.Document pdf = await MembershipCard.createStatement(value);

      var fileName =
          "${Get.find<AuthService>().user.value.name} Shramik Membership Card.pdf";
      final output = await getDownloadsDirectory();
      final file = File("${output!.path}/$fileName");
      await file.create().then((value) async {
        value.writeAsBytes(await pdf.save());
        isLoading.value = false;
        OpenFilex.open(value.path);
      });
    });
  }
}
