import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:south_canara/app/repositories/vendor_repository.dart';

import '../../../models/api_response.dart';
import '../../../models/blog_model.dart';
import '../../../models/contacted_seller_model.dart';
import '../../../models/notification_modle.dart';
import '../../../models/package_model.dart';
import '../../../models/slide_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/razorpay_gateway_service.dart';
import '../../category/controllers/category_controller.dart';
import '../../category/views/categories_screen.dart';
import '../../vendor/controllers/vendor_controller.dart';
import '../../vendor/views/vendor_screen.dart';
import '../views/home_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../views/notifications_screen.dart';

class HomeController extends GetxController {
  Rx<User> user = User().obs;
  // User(
  //         name: "Omkar Mhatre",
  //         coins: 1500,
  //         happiness: 25,
  //         email: "karomhatre@gmail.com",
  //         phoneNumber: "+919969383542")
  //     .obs;

  RxInt setTabIndex = 0.obs;
  RxBool isLiveAuction = true.obs;
  RxBool showMoreOptions = false.obs;
  List<String> moreOptions = ["Profile", "Logout"];
  RxString itemView = "LIST".obs;

  late var scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _userRepository;
  late SliderRepository _sliderRepository;
  late VendorRepository _vendorRepository;

  HomeController() {
    // Get.find<AuthService>().user.listen((updatedUser) {
    //   user.value = updatedUser;
    // });

    _userRepository = UserRepository();
    _sliderRepository = SliderRepository();
    _vendorRepository = VendorRepository();
  }

  RxBool searchedClicked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = false;

    user.value = Get.find<AuthService>().user.value;
    user.listen((updatedUser) {
      Get.find<AuthService>().user.value = updatedUser;
    });

    // if (Get.arguments != null) {
    //   setTabIndex.value = int.parse(Get.arguments["tabIndex"] as String);
    // }
    super.onInit();
    setTabIndex.listen((p0) {
      if (p0 == 1) {
        Get.find<CategoryController>().showSuppliers.value = false;
      } else if (p0 == 3) {
        Get.find<VendorController>().fetchData();
      }
    });

    homeRefresh(refresh: false);
  }

  // TABS
  final List bottomTabs = [
    {
      "title": translations.home.tr,
      "icon": "assets/ui/home_icon.png",
      "pos": "0",
      "view": const HomeView()
    },
    {
      "title": "Categories",
      "icon": "assets/ui/certificates.png",
      "pos": "1",
      "view": CategoryScreen()
    },

    {
      "title": "Notifications",
      "icon": "assets/ui/bell_notification_icon.png",
      "pos": "2",
      "view": NotificationView()
    },
    {
      "title": "Buyer/Seller",
      "icon": "assets/ui/user.png",
      "pos": "3",
      "view": const VendorScreen()
    },
    // {
    //   "title": "FAQ's",
    //   "icon": "assets/ui/setting_icon.png",
    //   "pos": "3",
    //   "view": Container()
    // }
  ];

  getTabScreen(index) {
    return bottomTabs[index]["view"];
  }

  void updateHome() async {
    // await _userRepository.fetchUser().then((value) {
    //   user.value = value;
    //   user.refresh();
    // });
  }

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) {
      if (value.status == Status.COMPLETED) {
        user = User().obs;
        user.value = value.data;
        // user.value.membershipId = u0.membershipId;
        // user.value.balance = u0.balance;
        user.refresh();
      } else {
        Get.find<AuthService>().removeCurrentUser();
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  DateFormat formater = DateFormat("dd/MM/yy");
  String getWeekDay(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("EEE").format(dateTime);
  }

  String getDate(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("d").format(dateTime);
  }

  RxList<Slide> sliders = <Slide>[].obs;
  RxInt selectedSlide = (-1).obs;

  RxBool isGridView = true.obs;

  void homeRefresh({bool? refresh}) async {
    updateUser();
    fetchPackages();
    fetchSliders(refresh ?? true);
    Get.find<CategoryController>().fetchCategories();
    fetchBlogs();
    fetchAdminMessages();
  }

  late Timer sliderTimer;
  PageController sliderPageController = PageController(initialPage: 0);
  fetchSliders(bool refresh) async {
    sliders.value = [];
    await _sliderRepository.fetchSliders().then((value) {
      if (value.status == Status.COMPLETED) {
        if (value.data != []) {
          sliders.value = value.data;
          selectedSlide.value = 0;
          if (!refresh) {
            sliderTimer =
                Timer.periodic(const Duration(milliseconds: 3000), (timer) {
              sliderPageController.animateToPage(
                  (sliderPageController.page!.toInt() + 1 % sliders.length),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn);
            });
          } else {
            sliderTimer.cancel();
            sliderTimer =
                Timer.periodic(const Duration(milliseconds: 3000), (timer) {
              sliderPageController.animateToPage(
                  (sliderPageController.page!.toInt() + 1 % sliders.length),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn);
            });
          }
        } else {}
        sliders.refresh();
      }
    });
  }

  RxList<Blog> blogs = <Blog>[].obs;

  Rx<Blog> selectedBlog = Blog().obs;

  fetchBlogs() async {
    blogs.value = [];
    _sliderRepository.fetchBlogs().then((value) {
      if (value.status == Status.COMPLETED) {
        blogs.value = value.data;
      }
    });
  }

  void onRoleSelected(Map<String, dynamic> element) {
    Get.toNamed(Routes.PACKAGES);
  }

  RxList<Package> packages = <Package>[
    // {
    //   "name": "Introductory Offer Free plan",
    //   "description":
    //       "In this plan, we will be giving 3 months free platform access to all users buyers and sellers",
    //   "price": "0",
    //   "duration": "3 months"
    // },
    // {
    //   "name": "Free plan",
    //   "description":
    //       "After Introductory plan, all user will fall to Free plan, features are\nI. User can send Enquiries to post.\nII. Can update profile\nIII. Can post his products.\nIV. Can get leads (this leads will be displayed in Enquiry tab of vender panel, but can not see. To see these enquiries, he has to subscribe our Economic Plan.",
    //   "price": "0",
    //   "duration": "3 months"
    // },
    // {
    //   "name": "Basic Plan",
    //   "description":
    //       "In this plan all features of Free Plan and buyer able to see seller details and contact them directly.",
    //   "price": "99",
    //   "duration": "30 Days"
    // },
    // {
    //   "name": "Economical Plan",
    //   "description":
    //       "In this Plan all features of Free Plan and Basic plan will be available, additionally Seller can view his lead enquiries and contact buyers.",
    //   "price": "299",
    //   "duration": "30 Days"
    // },
    // {
    //   "name": "Premium Plan",
    //   "description": "Under Development",
    //   "price": "N/A",
    //   "duration": "N/A Days"
    // }
  ].obs;

  fetchPackages() async {
    packages.value = [];
    await _sliderRepository.fetchPackages().then((value) {
      if (value.status == Status.COMPLETED) {
        packages.value = value.data;
      }
    });
  }

  void onPackageSelected(Package selectedPackage) {
    // Get.toNamed(Routes.TEMPLATES);
    RazorpayPG.getInstance.razorpayPayment("hhwvfwvfwyy1546aqafa");
  }

  // MY ENQUIRES
  RxList<ContactedSeller> myEnquires = <ContactedSeller>[].obs;
  fetchMyEnquires() async {
    // isLoading.value = true;
    await _userRepository.fetchMyEnquires().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        myEnquires.value = value.data;
        myEnquires.refresh();
      }
    });
  }

  // Admin Messages
  RxList<Notify> adminMessages = <Notify>[].obs;
  fetchAdminMessages() {
    isLoading.value = true;
    adminMessages.value = [];
    _vendorRepository.fetchAdminMessages().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        adminMessages.value = value.data;
      } else {
        adminMessages.value = [];
      }
    });
  }
}
