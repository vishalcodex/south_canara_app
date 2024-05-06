import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:south_canara/app/screens/category/controllers/category_controller.dart';
import 'package:south_canara/app/screens/category/views/categories_screen.dart';
import 'package:south_canara/app/services/razorpay_gateway_service.dart';

import '../../../models/ads_model.dart';
import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../views/contact_us_view.dart';
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

  HomeController() {
    // Get.find<AuthService>().user.listen((updatedUser) {
    //   user.value = updatedUser;
    // });

    _userRepository = UserRepository();
    _sliderRepository = SliderRepository();
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
      }
    });

    homeRefresh();
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
      "title": translations.contactUs.tr,
      "icon": "assets/ui/contact_us.png",
      "pos": "3",
      "view": const ContactUsView()
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
        Get.toNamed(Routes.AUTH);
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

  RxList<Ads> ads = <Ads>[].obs;
  RxInt selectedAd = 1.obs;

  RxBool isGridView = true.obs;

  void homeRefresh() async {
    // updateUser();
    // fetchSliders();
    // fetchCategories();
  }

  fetchSliders() async {
    ads.value = [];
    await _sliderRepository.fetchSliders().then((value) {
      if (value.data != []) {
        ads.value = value.data;
        selectedAd.value = ads.first.id!;
      } else {}
      ads.refresh();
    });
  }

  RxList<Category> categories = <Category>[].obs;

  Rx<Category> selectedCategory = Category().obs;
  RxList<Map<String, dynamic>> roles = <Map<String, dynamic>>[
    {
      "name": "Free Lancer",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer"
    },
    {
      "name": "Retailer",
      "description":
          "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios"
    },
    {
      "name": "Retailer",
      "description":
          "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness, including yoga studios"
    }
  ].obs;

  void onRoleSelected(Map<String, dynamic> element) {
    Get.toNamed(Routes.PACKAGES);
  }

  RxList<Map<String, dynamic>> packages = <Map<String, dynamic>>[
    {
      "name": "Free Package",
      "description":
          "Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer",
      "price": "0",
      "duration": "14 Days"
    },
    {
      "name": "Basic Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer",
      "price": "5000",
      "duration": "30 Days"
    },
    {
      "name": "Economical Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer",
      "price": "10000",
      "duration": "30 Days"
    },
    {
      "name": "Premium Package",
      "description":
          "Freelance Writer ,Graphic Designer , Software Developer ,Photographer, Consultant (in various fields such as business,finance, marketing, etc.), Small Business Owner, Real Estate Agent Personal Trainer, Artist (Painter, Sculptor, etc.), Web Developer Content Creator (YouTuber, Podcaster, Blogger), Virtual Assistant Online Tutor, Event Planner, Chef or Caterer",
      "price": "50000",
      "duration": "30 Days"
    }
  ].obs;

  void onPackageSelected(Map<String, dynamic> element) {
    // Get.toNamed(Routes.TEMPLATES);
    RazorpayPG.getInstance.razorpayPayment("hhwvfwvfwyy1546aqafa");
  }
}
