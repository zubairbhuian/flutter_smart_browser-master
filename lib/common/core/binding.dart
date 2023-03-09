import 'package:get/get.dart';
import 'package:smart_browser/view_model/home_view_model.dart';
import 'package:smart_browser/view_model/welcome_view_model.dart';
import 'package:smart_browser/view_model/setting_view_model.dart';
import 'package:smart_browser/view_model/response_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeViewModel());
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => SettingViewModel(), fenix: true);
    Get.lazyPut(() => ResponseViewModel(), fenix: true);
  }
}
