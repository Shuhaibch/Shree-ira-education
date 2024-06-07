// To parse this JSON data, do
//
//     final subCategoriesRespModel = subCategoriesRespModelFromJson(jsonString);

import 'dart:convert';

SubCategoriesRespModel subCategoriesRespModelFromJson(String str) =>
    SubCategoriesRespModel.fromJson(json.decode(str));

String subCategoriesRespModelToJson(SubCategoriesRespModel data) =>
    json.encode(data.toJson());

class SubCategoriesRespModel {
  String message;
  List<SubCategory> subCategories;

  SubCategoriesRespModel({
    required this.message,
    required this.subCategories,
  });

  SubCategoriesRespModel copyWith({
    String? message,
    List<SubCategory>? subCategories,
  }) =>
      SubCategoriesRespModel(
        message: message ?? this.message,
        subCategories: subCategories ?? this.subCategories,
      );

  factory SubCategoriesRespModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesRespModel(
        message: json["message"],
        subCategories: List<SubCategory>.from(
            json["SubCategories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "SubCategories":
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}

class SubCategory {
  int id;
  String categoryId;
  String title;
  String icon;
  String slug;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String coursesCount;

  SubCategory({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.icon,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.coursesCount,
  });

  SubCategory copyWith({
    int? id,
    String? categoryId,
    String? title,
    String? icon,
    String? slug,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? coursesCount,
  }) =>
      SubCategory(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        coursesCount: coursesCount ?? this.coursesCount,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"] ?? "",
        categoryId: json["category_id"] ?? "",
        title: json["title"] ?? "",
        icon: json["icon"] ?? "",
        slug: json["slug"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        coursesCount: json["courses_count"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "icon": icon,
        "slug": slug,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "courses_count": coursesCount,
      };
}
