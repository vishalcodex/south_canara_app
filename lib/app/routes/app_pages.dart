import 'package:south_canara/app/screens/category/binding/category_binding.dart';
import 'package:south_canara/app/screens/category/views/categories_screen.dart';

import '../middlewares/onboarding_middleware.dart';
import '../screens/account/views/my_profile.dart';
import '../components/congrats_screen.dart';
import '../screens/auth/views/get_started.dart';
import '../screens/auth/views/login_screen.dart';
import '../screens/auth/views/register_screen.dart';
import '../screens/home/views/create_website_screen.dart';
import '../screens/home/views/package_screen.dart';
import '../screens/payment/binding/payment_binding.dart';
import '../screens/payment/views/payment_complete_screen.dart';
import '../screens/payment/views/payment_screen.dart';
import '../screens/signup/binding/busniess_up_binding.dart';
import '../screens/signup/binding/sign_up_binding.dart';
import '../screens/signup/views/business_cateogry_form_screen.dart';
import '../screens/signup/views/business_contact_us_form_screen.dart';
import '../screens/signup/views/business_details_form_screen.dart';
import '../screens/signup/views/business_testimonial_form_screen.dart';
import '../screens/signup/views/sign_up_screen.dart';

import 'package:get/get.dart';
import '../components/splash.dart';
import '../screens/auth/binding/auth_binding.dart';
import '../screens/auth/views/auth_screen.dart';
import '../screens/auth/views/verify_otp_screen.dart';
import '../screens/blog/binding/blog_binding.dart';
import '../screens/blog/views/blog_details_screen.dart';
import '../screens/blog/views/blog_screen.dart';
import '../screens/home/binding/home_binding.dart';
import '../screens/home/views/advertisement_screen.dart';
import '../screens/home/views/dashboard_screen.dart';
import '../screens/onboarding/binding/onboarding_binding.dart';
import '../screens/onboarding/views/onboarding_view.dart';
import '../screens/template/binding/template_binding.dart';
import '../screens/template/views/template_preview_screen.dart';
import '../screens/template/views/templates_screen.dart';
import '../screens/vendor/binding/vendor_binding.dart';
import '../screens/vendor/views/enquires/enquires.dart';
import '../screens/vendor/views/messages/admin_messages.dart';
import '../screens/vendor/views/product/add_edit_product.dart';
import '../screens/vendor/views/product/my_products.dart';
import '../screens/vendor/views/profile/my_profile.dart';
import '../screens/vendor/views/profile/my_subscription.dart';
import '../screens/vendor/views/ticket/raise_ticket.dart';
import '../screens/vendor/views/vendor_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.GET_STARTED,
      page: () => GetStarted(),
      binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    // GetPage(
    //   name: Routes.FORGOT_PASSWORD,
    //   page: () => ForgotPasswordScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OTP_VERIFY,
      page: () => VerifyOTPScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ADVERTISEMENT,
      page: () => AdvertisementScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CONGRATS,
      page: () => CongratsScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    // GetPage(
    //   name: Routes.CREATE_VPIN,
    //   page: () => CreateVpinScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    // GetPage(
    //   name: Routes.CREATE_PASSWORD,
    //   page: () => CreatePasswordScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    GetPage(
      name: Routes.BLOG,
      page: () => BlogScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BLOG_DETAILS,
      page: () => BlogDetailsScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CREATE_WEBSITE,
      page: () => CreateWebsiteScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PACKAGES,
      page: () => PackagesScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.TEMPLATES,
      page: () => TemplatesScreen(),
      binding: TemplateBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.TEMPLATE_PREVIEW,
      page: () => TemplatePreviewScreen(),
      binding: TemplateBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),

    GetPage(
      name: Routes.BUSINESS_DETAIL_FORM,
      page: () => BusinessDetailFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),

    GetPage(
      name: Routes.BUSINESS_CATEGORY_FORM,
      page: () => BusinessCategoryFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_TESTIMONIALS_FORM,
      page: () => BusinessTestimonialFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_CONTACT_US_FORM,
      page: () => BusinessContactUsFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.WEB_CONGRATS,
      page: () => PaymentCompleteScreen(),
      binding: PaymentBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    //VENDOR
    GetPage(
      name: Routes.VENDOR,
      page: () => VendorScreen(),
      binding: VendorBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PRODUCTS,
      page: () => MyProductsScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductEditScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.VENDOR_PROFILE,
      page: () => ProfileEditScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_ENQUIRES,
      page: () => EnquiresScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.RAISE_TICKET,
      page: () => RaiseTicketScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ADMIN_MESSAGES,
      page: () => AdminMessagesScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SUBSCRIPTION,
      page: () => SubscriptionScreen(),
      binding: VendorBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
  ];
}
