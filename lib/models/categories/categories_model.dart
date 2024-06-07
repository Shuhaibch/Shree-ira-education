// To parse this JSON data, do
//
//     final categoriesRespModel = categoriesRespModelFromJson(jsonString);

import 'dart:convert';

CategoriesRespModel categoriesRespModelFromJson(String str) => CategoriesRespModel.fromJson(json.decode(str));

String categoriesRespModelToJson(CategoriesRespModel data) => json.encode(data.toJson());

class CategoriesRespModel {
    String message;
    List<Category> categories;

    CategoriesRespModel({
        required this.message,
        required this.categories,
    });

    CategoriesRespModel copyWith({
        String? message,
        List<Category>? categories,
    }) => 
        CategoriesRespModel(
            message: message ?? this.message,
            categories: categories ?? this.categories,
        );

    factory CategoriesRespModel.fromJson(Map<String, dynamic> json) => CategoriesRespModel(
        message: json["message"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String title;
    String icon;
    String slug;
    String featured;
    String status;
    String position;
    DateTime createdAt;
    DateTime updatedAt;
    String? catImage;

    Category({
        required this.id,
        required this.title,
        required this.icon,
        required this.slug,
        required this.featured,
        required this.status,
        required this.position,
        required this.createdAt,
        required this.updatedAt,
        required this.catImage,
    });

    Category copyWith({
        int? id,
        String? title,
        String? icon,
        String? slug,
        String? featured,
        String? status,
        String? position,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? catImage,
    }) => 
        Category(
            id: id ?? this.id,
            title: title ?? this.title,
            icon: icon ?? this.icon,
            slug: slug ?? this.slug,
            featured: featured ?? this.featured,
            status: status ?? this.status,
            position: position ?? this.position,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            catImage: catImage ?? this.catImage,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"]??"",
        title: json["title"]??'',
        icon: json["icon"]??"",
        slug: json["slug"]??"",
        featured: json["featured"]??'',
        status: json["status"]??"",
        position: json["position"]??"",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        catImage: json["cat_image"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "slug": slug,
        "featured": featured,
        "status": status,
        "position": position,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cat_image": catImage,
    };
}
