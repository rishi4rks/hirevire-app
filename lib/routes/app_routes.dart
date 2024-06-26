import 'package:get/get.dart';
import 'package:hirevire_app/common/screens/splash_screen.dart';
import 'package:hirevire_app/common/screens/unknown_route_screen.dart';
import 'package:hirevire_app/employer_interface/presentation/auth/bindings/emp_login_binding.dart';
import 'package:hirevire_app/employer_interface/presentation/auth/emp_login_screen.dart';
import 'package:hirevire_app/user_interface/presentation/base_navigator.dart';
import 'package:hirevire_app/common/screens/common_landing_screen.dart';
import 'package:hirevire_app/user_interface/presentation/onboarding/bindings/user_onb_binding.dart';
import 'package:hirevire_app/user_interface/presentation/onboarding/name_dob_section.dart';
import 'package:hirevire_app/user_interface/presentation/profile/sliding_base.dart';
import 'package:hirevire_app/user_interface/presentation/onboarding/otp_screen.dart';
import 'package:hirevire_app/user_interface/presentation/onboarding/user_email_validation_screen.dart';

class AppRoutes {
  // Routes
  static const String initialRoute = '/';
  static const String unknownRoute = '/unknownRoute';
  static const String commonOnboardingScreen = '/commonOnboardingScreen';

  // User Routes
  static const String userEamilValidationScreen = '/userEamilValidationScreen';
  static const String otpScreen = '/otpScreen';
  static const String nameScreen = '/nameScreen';
  static const String completeProfile = '/completeProfile';
  static const String userBaseNavigator = '/userBaseNavigator';

  // Employer Routes
  static const String empLoginScreen = '/empLoginScreen';

  // Pages
  static List<GetPage> pages = [
    // ######################### User Pages #########################
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: unknownRoute,
      page: () => const UnknownRouteScreen(),
    ),
    GetPage(
      name: commonOnboardingScreen,
      page: () => CommonLandingScreen(),
    ),
    GetPage(
      name: userEamilValidationScreen,
      page: () => const UserEmailValidationScreen(),
      binding: UserOnbBinding(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OTPScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: nameScreen,
      page: () => const NameDobSection(),
    ),
    GetPage(
      name: completeProfile,
      page: () => const SlidingBase(),
    ),
    GetPage(
      name: userBaseNavigator,
      page: () => const UserBaseNavigator(),
    ),

    // ######################### Employee Pages #########################
    GetPage(
      name: empLoginScreen,
      page: () => const EmpLoginScreen(),
      binding: EmpLoginBinding(),
    ),
  ];
}
