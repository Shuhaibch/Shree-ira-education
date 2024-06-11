import 'dart:convert';

CoursesRespModel coursesRespModelFromJson(String str) =>
    CoursesRespModel.fromJson(json.decode(str));

String coursesRespModelToJson(CoursesRespModel data) =>
    json.encode(data.toJson());

class CoursesRespModel {
  String message;
  List<Course> courses;

  CoursesRespModel({
    required this.message,
    required this.courses,
  });

  CoursesRespModel copyWith({
    String? message,
    List<Course>? courses,
  }) =>
      CoursesRespModel(
        message: message ?? this.message,
        courses: courses ?? this.courses,
      );

  factory CoursesRespModel.fromJson(Map<String, dynamic> json) =>
      CoursesRespModel(
        message: json["message"],
        courses:
            List<Course>.from(json["Courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class Course {
  int id;
  String userId;
  String categoryId;
  String subcategoryId;
  dynamic childcategoryId;
  String languageId;
  String title;
  String shortDetail;
  String detail;
  String requirement;
  String? price;
  String? discountPrice;
  dynamic day;
  dynamic video;
  String url;
  String featured;
  dynamic slug;
  String status;
  String previewImage;
  dynamic videoUrl;
  String previewType;
  String type;
  String duration;
  DateTime createdAt;
  DateTime updatedAt;
  String durationType;
  dynamic instructorRevenue;
  String involvementRequest;
  String curriculamIntroduction;
  String isRefer;
  String syllabus;

  Course({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.subcategoryId,
    required this.childcategoryId,
    required this.languageId,
    required this.title,
    required this.shortDetail,
    required this.detail,
    required this.requirement,
    required this.price,
    required this.discountPrice,
    required this.day,
    required this.video,
    required this.url,
    required this.featured,
    required this.slug,
    required this.status,
    required this.previewImage,
    required this.videoUrl,
    required this.previewType,
    required this.type,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.durationType,
    required this.instructorRevenue,
    required this.involvementRequest,
    required this.curriculamIntroduction,
    required this.isRefer,
    required this.syllabus,
  });

  Course copyWith({
    int? id,
    String? userId,
    String? categoryId,
    String? subcategoryId,
    dynamic childcategoryId,
    String? languageId,
    String? title,
    String? shortDetail,
    String? detail,
    String? requirement,
    String? price,
    String? discountPrice,
    dynamic day,
    dynamic video,
    String? url,
    String? featured,
    dynamic slug,
    String? status,
    String? previewImage,
    dynamic videoUrl,
    String? previewType,
    String? type,
    String? duration,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? durationType,
    dynamic instructorRevenue,
    String? involvementRequest,
    String? curriculamIntroduction,
    String? isRefer,
    String? syllabus,
  }) =>
      Course(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        categoryId: categoryId ?? this.categoryId,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        childcategoryId: childcategoryId ?? this.childcategoryId,
        languageId: languageId ?? this.languageId,
        title: title ?? this.title,
        shortDetail: shortDetail ?? this.shortDetail,
        detail: detail ?? this.detail,
        requirement: requirement ?? this.requirement,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        day: day ?? this.day,
        video: video ?? this.video,
        url: url ?? this.url,
        featured: featured ?? this.featured,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        previewImage: previewImage ?? this.previewImage,
        videoUrl: videoUrl ?? this.videoUrl,
        previewType: previewType ?? this.previewType,
        type: type ?? this.type,
        duration: duration ?? this.duration,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        durationType: durationType ?? this.durationType,
        instructorRevenue: instructorRevenue ?? this.instructorRevenue,
        involvementRequest: involvementRequest ?? this.involvementRequest,
        curriculamIntroduction:
            curriculamIntroduction ?? this.curriculamIntroduction,
        isRefer: isRefer ?? this.isRefer,
        syllabus: syllabus ?? this.syllabus,
      );

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        categoryId: json["category_id"] ?? '',
        subcategoryId: json["subcategory_id"] ?? '',
        childcategoryId: json["childcategory_id"] ?? '',
        languageId: json["language_id"] ?? '',
        title: json["title"] ?? '',
        shortDetail: json["short_detail"] ?? '',
        detail: json["detail"] ?? '',
        requirement: json["requirement"] ?? '',
        price: json["price"] ,
        discountPrice: json["discount_price"] ,
        day: json["day"] ?? '',
        video: json["video"] ?? '',
        url: json["url"] ?? '',
        featured: json["featured"] ?? '',
        slug: json["slug"] ?? '',
        status: json["status"] ?? '',
        previewImage: json["preview_image"] ?? '',
        videoUrl: json["video_url"] ?? '',
        previewType: json["preview_type"] ?? '',
        type: json["type"] ?? '',
        duration: json["duration"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        durationType: json["duration_type"] ?? '',
        instructorRevenue: json["instructor_revenue"] ?? '',
        involvementRequest: json["involvement_request"] ?? '',
        curriculamIntroduction: json["curriculam_introduction"] ?? '',
        isRefer: json["is_refer"] ?? '',
        syllabus: json["syllabus"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "childcategory_id": childcategoryId,
        "language_id": languageId,
        "title": title,
        "short_detail": shortDetail,
        "detail": detail,
        "requirement": requirement,
        "price": price,
        "discount_price": discountPrice,
        "day": day,
        "video": video,
        "url": url,
        "featured": featured,
        "slug": slug,
        "status": status,
        "preview_image": previewImage,
        "video_url": videoUrl,
        "preview_type": previewType,
        "type": type,
        "duration": duration,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "duration_type": durationType,
        "instructor_revenue": instructorRevenue,
        "involvement_request": involvementRequest,
        "curriculam_introduction": curriculamIntroduction,
        "is_refer": isRefer,
        "syllabus": syllabus,
      };
}
