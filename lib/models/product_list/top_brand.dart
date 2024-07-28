class TopBrandModel {
  TopBrandModel({
    required this.name,
    required this.url,
    required this.image,
  });

  String name;
  String url;
  String image;

  factory TopBrandModel.fromJson(Map<String, dynamic> json) => TopBrandModel(
    name: json["name"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "image": image
  };
}
