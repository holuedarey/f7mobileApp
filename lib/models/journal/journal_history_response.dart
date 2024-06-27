import 'dart:convert';

JournalHistoryResponse journalHistoryResFromJson(String str) =>
    JournalHistoryResponse.fromJson(json.decode(str));

String journalHistoryResToJson(JournalHistoryResponse data) =>
    json.encode(data.toJson());

class JournalHistoryResponse {
  Data? data;
  String? message;
  bool? isError;

  JournalHistoryResponse({
    this.data,
    this.message,
    this.isError,
  });

  factory JournalHistoryResponse.fromJson(Map<String, dynamic> json) =>
      JournalHistoryResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        isError: json["isError"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "isError": isError,
      };
}

class Data {
  List<JournalHistory>? items;
  Metadata? metadata;

  Data({
    this.items,
    this.metadata,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<JournalHistory>.from(
                json["items"]!.map((x) => JournalHistory.fromJson(x))),
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "metadata": metadata?.toJson(),
      };
}

class JournalHistory {
  String? title;
  String? uuid;
  String? iconUrl;
  String? journalIconId;
  String? name;
  String? content;
  DateTime? createdAt;
  DateTime? datePosted;

  JournalHistory({
    this.title,
    this.uuid,
    this.iconUrl,
    this.journalIconId,
    this.name,
    this.content,
    this.createdAt,
    this.datePosted,
  });

  factory JournalHistory.fromJson(Map<String, dynamic> json) => JournalHistory(
        title: json["title"],
        uuid: json["uuid"],
        iconUrl: json["icon_url"],
        journalIconId: json["journal_icon_id"],
        name: json["name"],
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        datePosted: json["date_posted"] == null
            ? null
            : DateTime.parse(json["date_posted"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "uuid": uuid,
        "icon_url": iconUrl,
        "journal_icon_id": journalIconId,
        "name": name,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "date_posted": datePosted?.toIso8601String(),
      };
}

class Metadata {
  int? from;
  int? to;
  int? currentPage;
  int? perPage;
  int? total;
  bool? hasMore;

  Metadata({
    this.from,
    this.to,
    this.currentPage,
    this.perPage,
    this.total,
    this.hasMore,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        from: json["from"],
        to: json["to"],
        currentPage: json["current_page"],
        perPage: json["per_page"],
        total: json["total"],
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "current_page": currentPage,
        "per_page": perPage,
        "total": total,
        "hasMore": hasMore,
      };
}
