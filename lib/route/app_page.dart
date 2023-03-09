import 'package:get/get.dart';
import 'package:smart_browser/route/app_route.dart';
import 'package:smart_browser/view/home/home_view.dart';
import 'package:smart_browser/view/setting/setting_view.dart';
import 'package:smart_browser/view/welcome/welcome_view.dart';
import 'package:smart_browser/view/response/response_view.dart';

abstract class AppPage {
  static const initial = AppRoute.welcome;

  static final routes = [
    GetPage(
      name: AppRoute.welcome,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoute.setting,
      page: () => const SettingView(),
    ),
    GetPage(
      name: AppRoute.response,
      page: () => const ResponseView(),
    ),
  ];
}
