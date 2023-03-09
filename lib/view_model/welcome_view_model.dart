import 'package:get/get.dart';
import 'package:smart_browser/route/app_route.dart';
import 'package:smart_browser/view_model/home_view_model.dart';
import 'package:smart_browser/view_model/setting_view_model.dart';

class WelcomeViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void onPressedHomeBtn() {
    Get.delete<HomeViewModel>();
    _goToHomeView();
  }

  Future<dynamic>? _goToHomeView() => Get.toNamed(AppRoute.home);

  void onPressedSettingBtn() {
    Get.delete<SettingViewModel>();
    _goToSettingView();
  }

  Future<dynamic>? _goToSettingView() => Get.toNamed(AppRoute.setting);
}
