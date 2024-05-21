import 'dart:async';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:hirevire_app/constants/persistence_keys.dart';
import 'package:hirevire_app/user_interface/onboarding/onboarding_screen.dart';
import 'package:hirevire_app/utils/persistence_handler.dart';

class NavigationController extends GetxController {
  RxBool isSignedIn = false.obs; // default: false

  RxInt currentTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    // await deleteAllLocalValues();
    await fetchAllLocalValues();
    // checkLocalValuesAndNavigate();
    navigate(() => toOnboardingScreen());
  }

  fetchAllLocalValues() async {
    isSignedIn.value =
        await PersistenceHandler.getBool(PersistenceKeys.isSignedIn) ??
            isSignedIn.value;
  }

  deleteAllLocalValues() async {
    await PersistenceHandler.deleteAll();
  }

  void toOnboardingScreen() {
    Get.to(() => const OnboardingScreen());
  }

  navigate(VoidCallback toScreen) {
    return Timer(const Duration(seconds: 1), () {
      toScreen();
    });
  }
}