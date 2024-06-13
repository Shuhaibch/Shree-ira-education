// To parse this JSON data, do
//
//     final mySubscribeCourseRespModel = mySubscribeCourseRespModelFromJson(jsonString);

import 'dart:convert';

MyEnrolledCourseRespModel mySubscribeCourseRespModelFromJson(String str) => MyEnrolledCourseRespModel.fromJson(json.decode(str));

String mySubscribeCourseRespModelToJson(MyEnrolledCourseRespModel data) => json.encode(data.toJson());

class MyEnrolledCourseRespModel {
    String? message;
    List<EnrollDetail>? enrollDetails;

    MyEnrolledCourseRespModel({
        this.message,
        this.enrollDetails,
    });

    MyEnrolledCourseRespModel copyWith({
        String? message,
        List<EnrollDetail>? enrollDetails,
    }) => 
        MyEnrolledCourseRespModel(
            message: message ?? this.message,
            enrollDetails: enrollDetails ?? this.enrollDetails,
        );

    factory MyEnrolledCourseRespModel.fromJson(Map<String, dynamic> json) => MyEnrolledCourseRespModel(
        message: json["message"],
        enrollDetails: json["enroll_details"] == null ? [] : List<EnrollDetail>.from(json["enroll_details"]!.map((x) => EnrollDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "enroll_details": enrollDetails == null ? [] : List<dynamic>.from(enrollDetails!.map((x) => x.toJson())),
    };
}

class EnrollDetail {
    String? title;
    Enroll? enroll;
    Course? course;

    EnrollDetail({
        this.title,
        this.enroll,
        this.course,
    });

    EnrollDetail copyWith({
        String? title,
        Enroll? enroll,
        Course? course,
    }) => 
        EnrollDetail(
            title: title ?? this.title,
            enroll: enroll ?? this.enroll,
            course: course ?? this.course,
        );

    factory EnrollDetail.fromJson(Map<String, dynamic> json) => EnrollDetail(
        title: json["title"],
        enroll: json["enroll"] == null ? null : Enroll.fromJson(json["enroll"]),
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "enroll": enroll?.toJson(),
        "course": course?.toJson(),
    };
}

class Course {
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
    List<dynamic>? whatlearns;
    List<dynamic>? include;
    List<dynamic>? progress;

    Course({
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
        this.whatlearns,
        this.include,
        this.progress,
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
        List<dynamic>? whatlearns,
        List<dynamic>? include,
        List<dynamic>? progress,
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
            curriculamIntroduction: curriculamIntroduction ?? this.curriculamIntroduction,
            isRefer: isRefer ?? this.isRefer,
            syllabus: syllabus ?? this.syllabus,
            whatlearns: whatlearns ?? this.whatlearns,
            include: include ?? this.include,
            progress: progress ?? this.progress,
        );

    factory Course.fromJson(Map<String, dynamic> json) => Course(
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
        whatlearns: json["whatlearns"] == null ? [] : List<dynamic>.from(json["whatlearns"]!.map((x) => x)),
        include: json["include"] == null ? [] : List<dynamic>.from(json["include"]!.map((x) => x)),
        progress: json["progress"] == null ? [] : List<dynamic>.from(json["progress"]!.map((x) => x)),
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
        "whatlearns": whatlearns == null ? [] : List<dynamic>.from(whatlearns!.map((x) => x)),
        "include": include == null ? [] : List<dynamic>.from(include!.map((x) => x)),
        "progress": progress == null ? [] : List<dynamic>.from(progress!.map((x) => x)),
    };
}

class Enroll {
    int? id;
    String? orderNo;
    DateTime? orderDate;
    String? courseId;
    String? userId;
    String? instructorId;
    dynamic orderId;
    dynamic transactionId;
    dynamic paymentMethod;
    String? totalAmount;
    String? couponDiscount;
    String? currency;
    String? currencyIcon;
    String? status;
    String? duration;
    DateTime? enrollStart;
    DateTime? enrollExpire;
    dynamic instructorRevenue;
    dynamic bundleId;
    dynamic bundleCourseId;
    dynamic proof;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic saleId;
    dynamic priceId;
    dynamic subscriptionId;
    dynamic customerId;
    dynamic subscriptionStatus;
    String? refunded;
    String? paymentStatus;
    dynamic description;
    String? enrollmentStatus;
    dynamic remarks;
    dynamic expiryDate;

    Enroll({
        this.id,
        this.orderNo,
        this.orderDate,
        this.courseId,
        this.userId,
        this.instructorId,
        this.orderId,
        this.transactionId,
        this.paymentMethod,
        this.totalAmount,
        this.couponDiscount,
        this.currency,
        this.currencyIcon,
        this.status,
        this.duration,
        this.enrollStart,
        this.enrollExpire,
        this.instructorRevenue,
        this.bundleId,
        this.bundleCourseId,
        this.proof,
        this.createdAt,
        this.updatedAt,
        this.saleId,
        this.priceId,
        this.subscriptionId,
        this.customerId,
        this.subscriptionStatus,
        this.refunded,
        this.paymentStatus,
        this.description,
        this.enrollmentStatus,
        this.remarks,
        this.expiryDate,
    });

    Enroll copyWith({
        int? id,
        String? orderNo,
        DateTime? orderDate,
        String? courseId,
        String? userId,
        String? instructorId,
        dynamic orderId,
        dynamic transactionId,
        dynamic paymentMethod,
        String? totalAmount,
        String? couponDiscount,
        String? currency,
        String? currencyIcon,
        String? status,
        String? duration,
        DateTime? enrollStart,
        DateTime? enrollExpire,
        dynamic instructorRevenue,
        dynamic bundleId,
        dynamic bundleCourseId,
        dynamic proof,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic saleId,
        dynamic priceId,
        dynamic subscriptionId,
        dynamic customerId,
        dynamic subscriptionStatus,
        String? refunded,
        String? paymentStatus,
        dynamic description,
        String? enrollmentStatus,
        dynamic remarks,
        dynamic expiryDate,
    }) => 
        Enroll(
            id: id ?? this.id,
            orderNo: orderNo ?? this.orderNo,
            orderDate: orderDate ?? this.orderDate,
            courseId: courseId ?? this.courseId,
            userId: userId ?? this.userId,
            instructorId: instructorId ?? this.instructorId,
            orderId: orderId ?? this.orderId,
            transactionId: transactionId ?? this.transactionId,
            paymentMethod: paymentMethod ?? this.paymentMethod,
            totalAmount: totalAmount ?? this.totalAmount,
            couponDiscount: couponDiscount ?? this.couponDiscount,
            currency: currency ?? this.currency,
            currencyIcon: currencyIcon ?? this.currencyIcon,
            status: status ?? this.status,
            duration: duration ?? this.duration,
            enrollStart: enrollStart ?? this.enrollStart,
            enrollExpire: enrollExpire ?? this.enrollExpire,
            instructorRevenue: instructorRevenue ?? this.instructorRevenue,
            bundleId: bundleId ?? this.bundleId,
            bundleCourseId: bundleCourseId ?? this.bundleCourseId,
            proof: proof ?? this.proof,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            saleId: saleId ?? this.saleId,
            priceId: priceId ?? this.priceId,
            subscriptionId: subscriptionId ?? this.subscriptionId,
            customerId: customerId ?? this.customerId,
            subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
            refunded: refunded ?? this.refunded,
            paymentStatus: paymentStatus ?? this.paymentStatus,
            description: description ?? this.description,
            enrollmentStatus: enrollmentStatus ?? this.enrollmentStatus,
            remarks: remarks ?? this.remarks,
            expiryDate: expiryDate ?? this.expiryDate,
        );

    factory Enroll.fromJson(Map<String, dynamic> json) => Enroll(
        id: json["id"],
        orderNo: json["order_no"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        courseId: json["course_id"],
        userId: json["user_id"],
        instructorId: json["instructor_id"],
        orderId: json["order_id"],
        transactionId: json["transaction_id"],
        paymentMethod: json["payment_method"],
        totalAmount: json["total_amount"],
        couponDiscount: json["coupon_discount"],
        currency: json["currency"],
        currencyIcon: json["currency_icon"],
        status: json["status"],
        duration: json["duration"],
        enrollStart: json["enroll_start"] == null ? null : DateTime.parse(json["enroll_start"]),
        enrollExpire: json["enroll_expire"] == null ? null : DateTime.parse(json["enroll_expire"]),
        instructorRevenue: json["instructor_revenue"],
        bundleId: json["bundle_id"],
        bundleCourseId: json["bundle_course_id"],
        proof: json["proof"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        saleId: json["sale_id"],
        priceId: json["price_id"],
        subscriptionId: json["subscription_id"],
        customerId: json["customer_id"],
        subscriptionStatus: json["subscription_status"],
        refunded: json["refunded"],
        paymentStatus: json["payment_status"],
        description: json["description"],
        enrollmentStatus: json["enrollment_status"],
        remarks: json["remarks"],
        expiryDate: json["expiry_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
        "course_id": courseId,
        "user_id": userId,
        "instructor_id": instructorId,
        "order_id": orderId,
        "transaction_id": transactionId,
        "payment_method": paymentMethod,
        "total_amount": totalAmount,
        "coupon_discount": couponDiscount,
        "currency": currency,
        "currency_icon": currencyIcon,
        "status": status,
        "duration": duration,
        "enroll_start": "${enrollStart!.year.toString().padLeft(4, '0')}-${enrollStart!.month.toString().padLeft(2, '0')}-${enrollStart!.day.toString().padLeft(2, '0')}",
        "enroll_expire": "${enrollExpire!.year.toString().padLeft(4, '0')}-${enrollExpire!.month.toString().padLeft(2, '0')}-${enrollExpire!.day.toString().padLeft(2, '0')}",
        "instructor_revenue": instructorRevenue,
        "bundle_id": bundleId,
        "bundle_course_id": bundleCourseId,
        "proof": proof,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sale_id": saleId,
        "price_id": priceId,
        "subscription_id": subscriptionId,
        "customer_id": customerId,
        "subscription_status": subscriptionStatus,
        "refunded": refunded,
        "payment_status": paymentStatus,
        "description": description,
        "enrollment_status": enrollmentStatus,
        "remarks": remarks,
        "expiry_date": expiryDate,
    };
}
