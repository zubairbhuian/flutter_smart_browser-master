import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_browser/route/app_page.dart';
import 'package:smart_browser/common/core/binding.dart';
import 'package:smart_browser/view/welcome/welcome_view.dart';
import 'package:smart_browser/common/helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ThemeHelper.setStatusBarStyle();
  runApp(const SmartBrowser());
}

class SmartBrowser extends StatelessWidget {
  const SmartBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
      theme: ThemeHelper.lightTheme(context),
      home: const WelcomeView(),
    );
  }
}
