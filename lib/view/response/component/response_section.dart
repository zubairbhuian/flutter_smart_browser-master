import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_browser/common/widget/custom_app_bar.dart';
import 'package:smart_browser/view_model/response_view_model.dart';
import 'package:smart_browser/view/response/component/'
    'response_list_section.dart';

class ResponseSection extends GetWidget<ResponseViewModel> {
  const ResponseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomAppBar(
        title: "Response List",
        body: ResponseListSection(
          responseViewModel: controller,
          responsesMap: controller.responsesMap.value.entries.toList(),
        ),
      ),
    );
  }
}
