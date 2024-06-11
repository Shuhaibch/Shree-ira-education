

import 'dart:convert';

CoursesByIDRespModel coursesRespModelFromJson(String str) => CoursesByIDRespModel.fromJson(json.decode(str));

String coursesRespModelToJson(CoursesByIDRespModel data) => json.encode(data.toJson());

class CoursesByIDRespModel {
    String? message;
    CourseByIdModel? course;

    CoursesByIDRespModel({
        this.message,
        this.course,
    });

    CoursesByIDRespModel copyWith({
        String? message,
        CourseByIdModel? course,
    }) => 
        CoursesByIDRespModel(
            message: message ?? this.message,
            course: course ?? this.course,
        );

    factory CoursesByIDRespModel.fromJson(Map<String, dynamic> json) => CoursesByIDRespModel(
        message: json["message"],
        course: json["Course"] == null ? null : CourseByIdModel.fromJson(json["Course"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "Course": course?.toJson(),
    };
}

class CourseByIdModel {
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
    dynamic syllabus;
    List<Theory>? theory;
    List<QuestionAnswer>? questionAnswers;
    List<Practical>? practicals;

    CourseByIdModel({
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
        this.theory,
        this.questionAnswers,
        this.practicals,
    });

    CourseByIdModel copyWith({
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
        dynamic syllabus,
        List<Theory>? theory,
        List<QuestionAnswer>? questionAnswers,
        List<Practical>? practicals,
    }) => 
        CourseByIdModel(
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
            theory: theory ?? this.theory,
            questionAnswers: questionAnswers ?? this.questionAnswers,
            practicals: practicals ?? this.practicals,
        );

    factory CourseByIdModel.fromJson(Map<String, dynamic> json) => CourseByIdModel(
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
        theory: json["theory"] == null ? [] : List<Theory>.from(json["theory"]!.map((x) => Theory.fromJson(x))),
        questionAnswers: json["question_answers"] == null ? [] : List<QuestionAnswer>.from(json["question_answers"]!.map((x) => QuestionAnswer.fromJson(x))),
        practicals: json["practicals"] == null ? [] : List<Practical>.from(json["practicals"]!.map((x) => Practical.fromJson(x))),
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
        "theory": theory == null ? [] : List<dynamic>.from(theory!.map((x) => x.toJson())),
        "question_answers": questionAnswers == null ? [] : List<dynamic>.from(questionAnswers!.map((x) => x.toJson())),
        "practicals": practicals == null ? [] : List<dynamic>.from(practicals!.map((x) => x.toJson())),
    };
}

class Practical {
    int? id;
    String? courseId;
    String? title;
    String? video;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Practical({
        this.id,
        this.courseId,
        this.title,
        this.video,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    Practical copyWith({
        int? id,
        String? courseId,
        String? title,
        String? video,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Practical(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            title: title ?? this.title,
            video: video ?? this.video,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Practical.fromJson(Map<String, dynamic> json) => Practical(
        id: json["id"],
        courseId: json["course_id"],
        title: json["title"],
        video: json["video"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "title": title,
        "video": video,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class QuestionAnswer {
    int? id;
    String? courseId;
    String? coursechapterId;
    String? title;
    dynamic image;
    dynamic zip;
    dynamic pdf;
    dynamic audio;
    dynamic size;
    String? url;
    dynamic iframeUrl;
    dynamic video;
    String? duration;
    String? status;
    String? featured;
    String? type;
    dynamic previewVideo;
    dynamic previewUrl;
    String? previewType;
    dynamic dateTime;
    String? detail;
    String? position;
    dynamic awsUpload;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userId;
    dynamic file;

    QuestionAnswer({
        this.id,
        this.courseId,
        this.coursechapterId,
        this.title,
        this.image,
        this.zip,
        this.pdf,
        this.audio,
        this.size,
        this.url,
        this.iframeUrl,
        this.video,
        this.duration,
        this.status,
        this.featured,
        this.type,
        this.previewVideo,
        this.previewUrl,
        this.previewType,
        this.dateTime,
        this.detail,
        this.position,
        this.awsUpload,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.file,
    });

    QuestionAnswer copyWith({
        int? id,
        String? courseId,
        String? coursechapterId,
        String? title,
        dynamic image,
        dynamic zip,
        dynamic pdf,
        dynamic audio,
        dynamic size,
        String? url,
        dynamic iframeUrl,
        dynamic video,
        String? duration,
        String? status,
        String? featured,
        String? type,
        dynamic previewVideo,
        dynamic previewUrl,
        String? previewType,
        dynamic dateTime,
        String? detail,
        String? position,
        dynamic awsUpload,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? userId,
        dynamic file,
    }) => 
        QuestionAnswer(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            coursechapterId: coursechapterId ?? this.coursechapterId,
            title: title ?? this.title,
            image: image ?? this.image,
            zip: zip ?? this.zip,
            pdf: pdf ?? this.pdf,
            audio: audio ?? this.audio,
            size: size ?? this.size,
            url: url ?? this.url,
            iframeUrl: iframeUrl ?? this.iframeUrl,
            video: video ?? this.video,
            duration: duration ?? this.duration,
            status: status ?? this.status,
            featured: featured ?? this.featured,
            type: type ?? this.type,
            previewVideo: previewVideo ?? this.previewVideo,
            previewUrl: previewUrl ?? this.previewUrl,
            previewType: previewType ?? this.previewType,
            dateTime: dateTime ?? this.dateTime,
            detail: detail ?? this.detail,
            position: position ?? this.position,
            awsUpload: awsUpload ?? this.awsUpload,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userId: userId ?? this.userId,
            file: file ?? this.file,
        );

    factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
        id: json["id"],
        courseId: json["course_id"],
        coursechapterId: json["coursechapter_id"],
        title: json["title"],
        image: json["image"],
        zip: json["zip"],
        pdf: json["pdf"],
        audio: json["audio"],
        size: json["size"],
        url: json["url"],
        iframeUrl: json["iframe_url"],
        video: json["video"],
        duration: json["duration"],
        status: json["status"],
        featured: json["featured"],
        type: json["type"],
        previewVideo: json["preview_video"],
        previewUrl: json["preview_url"],
        previewType: json["preview_type"],
        dateTime: json["date_time"],
        detail: json["detail"],
        position: json["position"],
        awsUpload: json["aws_upload"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "coursechapter_id": coursechapterId,
        "title": title,
        "image": image,
        "zip": zip,
        "pdf": pdf,
        "audio": audio,
        "size": size,
        "url": url,
        "iframe_url": iframeUrl,
        "video": video,
        "duration": duration,
        "status": status,
        "featured": featured,
        "type": type,
        "preview_video": previewVideo,
        "preview_url": previewUrl,
        "preview_type": previewType,
        "date_time": dateTime,
        "detail": detail,
        "position": position,
        "aws_upload": awsUpload,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "file": file,
    };
}

class Theory {
    int? id;
    String? courseId;
    String? chapterName;
    dynamic shortNumber;
    String? status;
    String? file;
    dynamic description;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userId;

    Theory({
        this.id,
        this.courseId,
        this.chapterName,
        this.shortNumber,
        this.status,
        this.file,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.userId,
    });

    Theory copyWith({
        int? id,
        String? courseId,
        String? chapterName,
        dynamic shortNumber,
        String? status,
        String? file,
        dynamic description,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? userId,
    }) => 
        Theory(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            chapterName: chapterName ?? this.chapterName,
            shortNumber: shortNumber ?? this.shortNumber,
            status: status ?? this.status,
            file: file ?? this.file,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userId: userId ?? this.userId,
        );

    factory Theory.fromJson(Map<String, dynamic> json) => Theory(
        id: json["id"],
        courseId: json["course_id"],
        chapterName: json["chapter_name"],
        shortNumber: json["short_number"],
        status: json["status"],
        file: json["file"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "chapter_name": chapterName,
        "short_number": shortNumber,
        "status": status,
        "file": file,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
    };
}
