import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static const String welcomeMessage = "welcomeMessage",
      webUrls = "webUrls",
      chatGptResponse = "chatGptResponse";

  static writeGetStorageValue(String key, dynamic value) =>
      GetStorage().write(key, value);

  static readGetStorageValue(String key) => GetStorage().read(key);

  static removeGetStorageKey(String key) => GetStorage().remove(key);
}
