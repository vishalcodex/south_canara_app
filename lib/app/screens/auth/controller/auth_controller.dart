import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class AuthController extends GetxController {
  Rx<User> user = User().obs;
  Rx<String> otp = "".obs;
  late UserRepository _userRepository;
  RxBool isLoading = false.obs;
  // RxBool isLogin = true.obs;
  RxInt currentView = 0.obs;
  RxBool showPassword = false.obs;

  RxBool validEmail = false.obs;
  RxBool validPhone = false.obs;
  RxBool validVpin = false.obs;
  RxBool verifyVpin = false.obs;

  RxBool isError = false.obs;
  RxBool isVisible = false.obs;
  RxString errorMessage = "".obs;
  // final _otplessFlutterPlugin = Otpless();
  // RxInt onStep = 1.obs;

  AuthController() {
    _userRepository = UserRepository();
  }

  Map creds = {
    // "email": "karomhatre@gmail.com",
    // "phone": "9969383542",
    // "vpin": "0125",
    // "password": "p@ssw0rd"
  };
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // if (Get.arguments != null) {
    //   toLogin.value = Get.arguments["toLogin"];
    // }
  }

  RxBool viaPassword = false.obs;
  RegExp emailValidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //StepOne
  RxString text = "".obs;
  RxBool isOtpSent = false.obs;
  RxBool isResent = false.obs;
  RxBool toLogin = false.obs;

  late Timer timer;
  RxInt times = 30.obs;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (times == 0) {
        timer.cancel();
        isResent.value = false;
      } else {
        times--;
      }
    });
  }

  void checkEmail() {
    validEmail.value = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(creds["email"]!);
    validEmail.refresh();
  }

  void checkPhone() {
    validPhone.value = creds["phone"]!.length == 10;
    // validPhone.value =
    //     RegExp(r"/^([+]\d{2})?\d{10}$/").hasMatch("+91${creds["phone"]!}");
    validPhone.refresh();
  }

  void getOtp() {
    // isLoading.value = true;
    // errorMessage.value = "";
    // _userRepository.signUp(creds["phone"].toString()).then((value) {
    //   isLoading.value = false;
    //   if (value.status == Status.COMPLETED) {
    //     Get.toNamed(Routes.OTP_VERIFY);
    //   } else {
    //     errorMessage.value = value.message!;
    //     errorMessage.refresh();
    //   }
    // });
  }

  // void verifyOTP() {
  // if (toLogin.value) {
  //   user.value.token = "Authorised";
  //   Get.find<AuthService>().saveUser(user.value).then((value) {
  //     Get.offAndToNamed(Routes.HOME);
  //   });
  // } else {
  // }
  // Get.toNamed(Routes.REGISTER);
  // isLoading.value = true;
  // errorMessage.value = "";
  // _userRepository.verifyOtp(
  //     {"phone": creds["phone"], "otp": creds["otp"]}).then((value) {
  //   isLoading.value = false;
  //   if (value.status == Status.COMPLETED) {
  //     Get.find<AuthService>().saveUser(value.data);
  //     Get.toNamed(Routes.CONGRATS, arguments: {
  //       "title": "Verification Successful!",
  //       "message": "Your account has verified\n successfully.",
  //       "image": "assets/ui/complete/verification_complete.png"
  //     });
  //     Future.delayed(const Duration(seconds: 2), () {
  //       Get.offAndToNamed(Routes.CREATE_PASSWORD);
  //     });
  //   } else {
  //     errorMessage.value = value.message!;
  //     errorMessage.refresh();
  //   }
  // });
  // }

  RxBool isCustomer = true.obs;

  Future signIn({bool? toRsd}) async {
    // isLoading.value = true;
    // errorMessage.value =
    //     //  creds["mobile_number"] == "" || creds["mobile_number"] == null
    //     //       ? "Phone Number should not be empty"
    //     //       :
    //     creds["mobile_number"] == "" || creds["mobile_number"] == null
    //         ? translations.emailIsEmpty.tr
    //         // : creds["location"] == "" || creds["location"] == null
    //         //     ? "Location should not be empty"
    //         : creds["password"] == "" || creds["password"] == null
    //             ? translations.passwordIsEmpty.tr
    //             : "";
    // if (errorMessage.value != "") {
    //   isLoading.value = false;
    //   return;
    // }
    // _userRepository.login({
    //   "email": creds["mobile_number"],
    //   "password": creds["password"]
    // }).then((value) {
    //   isLoading.value = false;
    //   if (value.status == Status.COMPLETED) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        message: translations.successfulLoginMsg.tr,
      ),
    );
    user.value.token = "Authorised";
    // Get.find<AuthService>().setIsCustomer(isCustomer.value);
    Get.find<AuthService>().saveUser(user.value).then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.HOME);
      });
    });
    //     verifyVpin.value = false;
    //   } else {
    //     errorMessage.value = value.message ?? translations.invalidCreds.tr;
    //   }
    // });
  }

  Future register() async {
    isLoading.value = true;
    // errorMessage.value = creds["name"] == "" || creds["name"] == null
    //     ? "Name should not be Empty"
    //     : creds["mobile_number"] == "" || creds["mobile_number"] == null
    //         ? "Phone Number should not be empty"
    //         : creds["email"] == "" || creds["email"] == null
    //             ? translations.emailIsEmpty.tr
    //             // : creds["location"] == "" || creds["location"] == null
    //             //     ? "Location should not be empty"
    //             : creds["password"] == "" || creds["password"] == null
    //                 ? translations.passwordIsEmpty.tr
    //                 : "";
    // if (errorMessage.value != "") {
    //   isLoading.value = false;
    //   return;
    // }
    user.value.token = "Authorised";
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 5),
        message: translations.registeredSuccessfully.tr,
      ),
    );
    // Get.find<AuthService>().setIsCustomer(isCustomer.value);
    Get.find<AuthService>().saveUser(user.value).then((value) {
      isLoading.value = false;
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAndToNamed(Routes.HOME);
      });
    });
    // errorMessage.value = "";
    // _userRepository.register({
    //   "name": creds["name"],
    //   "phone": creds["mobile_number"],
    //   "email": creds["email"],
    //   "password": creds["password"],
    // }).then((value) {
    //   isLoading.value = false;
    //   if (value.status == Status.COMPLETED) {
    //     Get.showSnackbar(
    //       GetSnackBar(
    //         duration: const Duration(seconds: 5),
    //         message: translations.registeredSuccessfully.tr,
    //       ),
    //     );
    //     Get.find<AuthService>().saveUser(value.data).then((value) {
    //       Future.delayed(const Duration(seconds: 2), () {
    //         Get.offAndToNamed(Routes.SIGN_UP);
    //       });
    //     });
    //   } else {
    //     errorMessage.value =
    //         value.message ?? translations.errorUpdatingDetails.tr;
    //   }
    // });
  }

  void forgotPassword() async {
    // if (creds["email"] != null && creds["email"] != "") {
    //   await _userRepository.forgotPassword(creds["email"]).then((value) {
    //     if (value.status == Status.COMPLETED) {
    //       currentView.value = 0;
    //       Get.showSnackbar(GetSnackBar(
    //         duration: const Duration(seconds: 3),
    //         message: value.data["message"],
    //       ));
    //     } else {
    //       currentView.value = 0;
    //       Get.showSnackbar(GetSnackBar(
    //         duration: const Duration(seconds: 3),
    //         message: value.message,
    //       ));
    //     }
    //   });
    // } else {
    //   Get.showSnackbar(const GetSnackBar(
    //     duration: Duration(seconds: 3),
    //     message: "Invalid Email",
    //   ));
    // }
  }

  String verifyId = "";
  void sendOTP() async {
    Get.toNamed(Routes.OTP_VERIFY);

    // if (user.value.phoneNumber == null ||
    //     user.value.phoneNumber!.length != 10) {
    //   Get.showSnackbar(GetSnackBar(
    //     backgroundColor: ColorPallete.red,
    //     duration: const Duration(seconds: 3),
    //     message: translations.invalidPhoneNumber.tr,
    //   ));
    // } else {
    //   isLoading.value = true;
    //   await fb.FirebaseAuth.instance.verifyPhoneNumber(
    //     phoneNumber: "+91${user.value.phoneNumber}",
    //     verificationCompleted: (phoneAuthCredential) async {
    //       await fb.FirebaseAuth.instance
    //           .signInWithCredential(phoneAuthCredential)
    //           .then(
    //         (value) {
    //           // otpSent.value = false;
    //           creds["number"] = "";
    //           Get.showSnackbar(GetSnackBar(
    //               duration: const Duration(seconds: 3),
    //               message: translations.phoneNumberVerified.tr));
    //         },
    //       );
    //     },
    //     verificationFailed: (error) {
    //       isLoading.value = false;
    //       log(error.message!);
    //     },
    //     codeSent: (verificationId, forceResendingToken) {
    //       isLoading.value = false;
    //       verifyId = verificationId;
    //       Get.toNamed(Routes.OTP_VERIFY);
    //     },
    //     codeAutoRetrievalTimeout: (verificationId) {
    //       verifyId = verificationId;
    //     },
    //   );
    // }
  }

  void verifyOTP() async {
    Get.toNamed(Routes.LOGIN);
    // isLoading.value = true;
    // if (creds["otp"].toString().length == 6) {
    //   fb.PhoneAuthCredential credential = fb.PhoneAuthProvider.credential(
    //       verificationId: verifyId, smsCode: creds["otp"]);
    //   // Sign the user in (or link) with the credential
    //   try {
    //     await fb.FirebaseAuth.instance
    //         .signInWithCredential(credential)
    //         .then((value) {
    //       isLoading.value = false;
    //       Get.toNamed(Routes.REGISTER);
    //       Get.showSnackbar(GetSnackBar(
    //           duration: const Duration(seconds: 3),
    //           message: translations.phoneNumberVerified.tr));
    //     });
    //   } catch (e) {
    //     isLoading.value = false;
    //     Get.showSnackbar(GetSnackBar(
    //       duration: const Duration(seconds: 3),
    //       message: translations.invalidOtp.tr,
    //     ));
    //   }
    // } else {
    //   isLoading.value = false;
    //   Get.showSnackbar(GetSnackBar(
    //     duration: const Duration(seconds: 3),
    //     message: translations.invalidOtp.tr,
    //   ));
    // }
  }

// REGISTRATION
}
