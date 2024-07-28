// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? type;
  String? shortDescription;
  String? description;
  bool? onSale;
  String? priceHtml;
  String? price;
  String? averageRating;
  int? reviewCount;
  List<Images>? images;
  List<Category>? categories;
  List<Category>? tags;

  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.type,
    this.shortDescription,
    this.description,
    this.onSale,
    this.priceHtml,
    this.price,
    this.averageRating,
    this.reviewCount,
    this.images,
    this.categories,
    this.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    parent: json["parent"],
    type: json["type"],
    shortDescription: json["short_description"],
    description: json["description"],
    onSale: json["on_sale"],
    priceHtml: json["price_html"],
    price: json["price"],
    averageRating: json["average_rating"],
    reviewCount: json["review_count"],
    images: json["images"] == null ? [] : List<Images>.from(json["images"]!.map((x) => Images.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    tags: json["tags"] == null ? [] : List<Category>.from(json["tags"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "parent": parent,
    "type": type,
    "short_description": shortDescription,
    "description": description,
    "on_sale": onSale,
    "price_html": priceHtml,
    "price": price,
    "average_rating": averageRating,
    "review_count": reviewCount,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? link;

  Category({
    this.id,
    this.name,
    this.slug,
    this.link,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "link": link,
  };
}

class Images {
  int? id;
  String? src;
  String? thumbnail;
  String? srcset;
  String? sizes;
  String? name;
  String? alt;

  Images({
    this.id,
    this.src,
    this.thumbnail,
    this.srcset,
    this.sizes,
    this.name,
    this.alt,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    src: json["src"],
    thumbnail: json["thumbnail"],
    srcset: json["srcset"],
    sizes: json["sizes"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "src": src,
    "thumbnail": thumbnail,
    "srcset": srcset,
    "sizes": sizes,
    "name": name,
    "alt": alt,
  };
}
