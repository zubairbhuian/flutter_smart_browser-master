import 'package:get/get.dart';
import 'package:smart_browser/common/helper/get_storage_helper.dart';

class ResponseViewModel extends GetxController
    with StateMixin<List<MapEntry<String, dynamic>>> {
  RxMap<String, dynamic> responsesMap = <String, dynamic>{}.obs;

  @override
  void onInit() {
    _getSharedPrefValue();
    super.onInit();
  }

  void _getSharedPrefValue() {
    responsesMap.addAll(GetStorageHelper.readGetStorageValue(
            GetStorageHelper.chatGptResponse) ??
        {});
    change(responsesMap.entries.toList(), status: RxStatus.success());
  }
}
