import 'dart:convert';

ChatGptModel chatGptModelFromJson(String str) =>
    ChatGptModel.fromJson(json.decode(str));

String chatGptModelToJson(ChatGptModel data) => json.encode(data.toJson());

class ChatGptModel {
  ChatGptModel({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
  });

  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<Choice>? choices;
  final Usage? usage;

  factory ChatGptModel.fromJson(Map<String, dynamic> json) => ChatGptModel(
        id: json["id"] ?? "",
        object: json["object"] ?? "",
        created: json["created"] ?? 0,
        model: json["model"] ?? "",
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
        usage: json["usage"] == null ? Usage() : Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "object": object ?? "",
        "created": created ?? 0,
        "model": model ?? "",
        "choices": choices == null
            ? []
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
        "usage": usage!.toJson(),
      };
}

class Choice {
  Choice({
    this.text,
    this.index,
    this.logprobs,
    this.finishReason,
  });

  final String? text;
  final int? index;
  final dynamic logprobs;
  final String? finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"] ?? "",
        index: json["index"] ?? 0,
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "text": text ?? "",
        "index": index ?? 0,
        "logprobs": logprobs,
        "finish_reason": finishReason ?? "",
      };
}

class Usage {
  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"] ?? 0,
        completionTokens: json["completion_tokens"] ?? 0,
        totalTokens: json["total_tokens"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens ?? 0,
        "completion_tokens": completionTokens ?? 0,
        "total_tokens": totalTokens ?? 0,
      };
}
