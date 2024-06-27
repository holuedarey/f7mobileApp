import 'dart:convert';

EmotionsResponse memberContactFromJson(String str) =>
    EmotionsResponse.fromJson(json.decode(str));

String memberContactToJson(EmotionsResponse data) => json.encode(data.toJson());

class EmotionsResponse {
  List<Emotions>? data;
  String? message;
  bool? isError;

  EmotionsResponse({
    this.data,
    this.message,
    this.isError,
  });

  factory EmotionsResponse.fromJson(Map<String, dynamic> json) =>
      EmotionsResponse(
        data: json["data"] == null
            ? []
            : List<Emotions>.from(
                json["data"]!.map((x) => Emotions.fromJson(x))),
        message: json["message"],
        isError: json["isError"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "isError": isError,
      };
}

class Emotions {
  String? name;
  String? iconUrl;
  String? uuid;

  Emotions({
    this.name,
    this.iconUrl,
    this.uuid,
  });

  factory Emotions.fromJson(Map<String, dynamic> json) => Emotions(
        name: json["name"],
        iconUrl: json["icon_url"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon_url": iconUrl,
        "uuid": uuid,
      };
}
