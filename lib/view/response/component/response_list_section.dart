import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_browser/view_model/response_view_model.dart';
import 'package:smart_browser/common/widget/custom_progress_bar.dart';
import 'package:smart_browser/view/response/component/'
    'custom_response_item.dart';

class ResponseListSection extends StatelessWidget {
  final ResponseViewModel responseViewModel;
  final List<MapEntry<String, dynamic>> responsesMap;

  const ResponseListSection({
    Key? key,
    required this.responseViewModel,
    required this.responsesMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return responseViewModel.obx(
      (state) => responsesMap.isEmpty
          ? _returnEmptyView(context)
          : ListView.builder(
              itemCount: responsesMap.length,
              itemBuilder: (context, index) => CustomResponseItem(
                ask: responsesMap[index].key,
                response: responsesMap[index].value,
              ),
            ),
      onEmpty: _returnEmptyView(context),
      onLoading: const CustomProgressBar(),
    );
  }

  Widget _returnEmptyView(BuildContext context) => Center(
        child: Text(
          "No response found!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
}
