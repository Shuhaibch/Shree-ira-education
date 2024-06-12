// To parse this JSON data, do
//
//     final cartRespModel = cartRespModelFromJson(jsonString);

import 'dart:convert';

CartRespModel cartRespModelFromJson(String str) => CartRespModel.fromJson(json.decode(str));

String cartRespModelToJson(CartRespModel data) => json.encode(data.toJson());

class CartRespModel {
    String? message;
    List<CartCourse>? cart;

    CartRespModel({
        this.message,
        this.cart,
    });

    CartRespModel copyWith({
        String? message,
        List<CartCourse>? cart,
    }) => 
        CartRespModel(
            message: message ?? this.message,
            cart: cart ?? this.cart,
        );

    factory CartRespModel.fromJson(Map<String, dynamic> json) => CartRespModel(
        message: json["message"],
        cart: json["cart"] == null ? [] : List<CartCourse>.from(json["cart"]!.map((x) => CartCourse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
    };
}

class CartCourse {
    int? id;
    String? userId;
    String? courseId;
    String? categoryId;
    String? price;
    String? offerPrice;
    dynamic disamount;
    dynamic distype;
    dynamic bundleId;
    String? type;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic couponId;
    Courses? courses;

    CartCourse({
        this.id,
        this.userId,
        this.courseId,
        this.categoryId,
        this.price,
        this.offerPrice,
        this.disamount,
        this.distype,
        this.bundleId,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.couponId,
        this.courses,
    });

    CartCourse copyWith({
        int? id,
        String? userId,
        String? courseId,
        String? categoryId,
        String? price,
        String? offerPrice,
        dynamic disamount,
        dynamic distype,
        dynamic bundleId,
        String? type,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic couponId,
        Courses? courses,
    }) => 
        CartCourse(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            courseId: courseId ?? this.courseId,
            categoryId: categoryId ?? this.categoryId,
            price: price ?? this.price,
            offerPrice: offerPrice ?? this.offerPrice,
            disamount: disamount ?? this.disamount,
            distype: distype ?? this.distype,
            bundleId: bundleId ?? this.bundleId,
            type: type ?? this.type,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            couponId: couponId ?? this.couponId,
            courses: courses ?? this.courses,
        );

    factory CartCourse.fromJson(Map<String, dynamic> json) => CartCourse(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        categoryId: json["category_id"],
        price: json["price"],
        offerPrice: json["offer_price"],
        disamount: json["disamount"],
        distype: json["distype"],
        bundleId: json["bundle_id"],
        type: json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        couponId: json["coupon_id"],
        courses: json["courses"] == null ? null : Courses.fromJson(json["courses"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_id": courseId,
        "category_id": categoryId,
        "price": price,
        "offer_price": offerPrice,
        "disamount": disamount,
        "distype": distype,
        "bundle_id": bundleId,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "coupon_id": couponId,
        "courses": courses?.toJson(),
    };
}

class Courses {
    int? id;
    String? userId;
    String? categoryId;
    String? subcategoryId;
    dynamic childcategoryId;
    String? languageId;
    String? title;
    String? shortDetail;
    String? detail;
    String? requirement;
    String? price;
    String? discountPrice;
    dynamic day;
    dynamic video;
    String? url;
    String? featured;
    dynamic slug;
    String? status;
    String? previewImage;
    dynamic videoUrl;
    String? previewType;
    String? type;
    String? duration;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? durationType;
    dynamic instructorRevenue;
    String? involvementRequest;
    String? curriculamIntroduction;
    String? isRefer;
    String? syllabus;

    Courses({
        this.id,
        this.userId,
        this.categoryId,
        this.subcategoryId,
        this.childcategoryId,
        this.languageId,
        this.title,
        this.shortDetail,
        this.detail,
        this.requirement,
        this.price,
        this.discountPrice,
        this.day,
        this.video,
        this.url,
        this.featured,
        this.slug,
        this.status,
        this.previewImage,
        this.videoUrl,
        this.previewType,
        this.type,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.durationType,
        this.instructorRevenue,
        this.involvementRequest,
        this.curriculamIntroduction,
        this.isRefer,
        this.syllabus,
    });

    Courses copyWith({
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
        Courses(
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
            curriculamIntroduction: curriculamIntroduction ?? this.curriculamIntroduction,
            isRefer: isRefer ?? this.isRefer,
            syllabus: syllabus ?? this.syllabus,
        );

    factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        childcategoryId: json["childcategory_id"],
        languageId: json["language_id"],
        title: json["title"],
        shortDetail: json["short_detail"],
        detail: json["detail"],
        requirement: json["requirement"],
        price: json["price"],
        discountPrice: json["discount_price"],
        day: json["day"],
        video: json["video"],
        url: json["url"],
        featured: json["featured"],
        slug: json["slug"],
        status: json["status"],
        previewImage: json["preview_image"],
        videoUrl: json["video_url"],
        previewType: json["preview_type"],
        type: json["type"],
        duration: json["duration"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        durationType: json["duration_type"],
        instructorRevenue: json["instructor_revenue"],
        involvementRequest: json["involvement_request"],
        curriculamIntroduction: json["curriculam_introduction"],
        isRefer: json["is_refer"],
        syllabus: json["syllabus"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "duration_type": durationType,
        "instructor_revenue": instructorRevenue,
        "involvement_request": involvementRequest,
        "curriculam_introduction": curriculamIntroduction,
        "is_refer": isRefer,
        "syllabus": syllabus,
    };
}
