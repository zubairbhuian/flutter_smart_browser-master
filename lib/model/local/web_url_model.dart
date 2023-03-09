import 'dart:convert';

List<WebUrlModel> webUrlModelFromJson(String str) => List<WebUrlModel>.from(
    json.decode(str).map((x) => WebUrlModel.fromJson(x)));

String webUrlModelToJson(List<WebUrlModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WebUrlModel {
  String? webUrl;
  String? copyClass;
  String? copyClassParent;
  String? pasteId;

  WebUrlModel(this.webUrl, this.copyClass, this.copyClassParent, this.pasteId);

  WebUrlModel.fromJson(Map<String, dynamic> json)
      : webUrl = json["web_url"],
        copyClass = json["copy_class"],
        copyClassParent = json["copy_class_parent"],
        pasteId = json["paste_id"];

  Map<String, dynamic> toJson() => {
        "web_url": webUrl,
        "copy_class": copyClass,
        "copy_class_parent": copyClassParent,
        "paste_id": pasteId,
      };
}
