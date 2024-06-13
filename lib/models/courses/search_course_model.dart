
import 'dart:convert';

SearchCourseRespModel searchCourseRespModelFromJson(String str) => SearchCourseRespModel.fromJson(json.decode(str));

String searchCourseRespModelToJson(SearchCourseRespModel data) => json.encode(data.toJson());

class SearchCourseRespModel {
    String? message;
    List<Course>? course;

    SearchCourseRespModel({
        this.message,
        this.course,
    });

    SearchCourseRespModel copyWith({
        String? message,
        List<Course>? course,
    }) => 
        SearchCourseRespModel(
            message: message ?? this.message,
            course: course ?? this.course,
        );

    factory SearchCourseRespModel.fromJson(Map<String, dynamic> json) => SearchCourseRespModel(
        message: json["message"],
        course: json["Course"] == null ? [] : List<Course>.from(json["Course"]!.map((x) => Course.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "Course": course == null ? [] : List<dynamic>.from(course!.map((x) => x.toJson())),
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
    String? slug;
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
    User? user;

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
        this.user,
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
        String? slug,
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
        User? user,
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
            user: user ?? this.user,
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? fname;
    String? lname;
    dynamic dob;
    dynamic doa;
    dynamic mobile;
    String? email;
    dynamic address;
    dynamic marriedStatus;
    dynamic cityId;
    dynamic stateId;
    dynamic countryId;
    dynamic gender;
    dynamic pinCode;
    String? status;
    String? verified;
    dynamic userImg;
    String? role;
    DateTime? emailVerifiedAt;
    dynamic detail;
    String? braintreeId;
    dynamic fbUrl;
    dynamic twitterUrl;
    dynamic youtubeUrl;
    dynamic linkedinUrl;
    dynamic preferPayMethod;
    dynamic paypalEmail;
    dynamic paytmMobile;
    dynamic bankAccName;
    dynamic bankAccNo;
    dynamic ifscCode;
    dynamic bankName;
    dynamic facebookId;
    dynamic googleId;
    dynamic amazonId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic zoomEmail;
    dynamic jwtToken;
    dynamic gitlabId;
    dynamic linkedinId;
    dynamic twitterId;
    dynamic code;

    User({
        this.id,
        this.fname,
        this.lname,
        this.dob,
        this.doa,
        this.mobile,
        this.email,
        this.address,
        this.marriedStatus,
        this.cityId,
        this.stateId,
        this.countryId,
        this.gender,
        this.pinCode,
        this.status,
        this.verified,
        this.userImg,
        this.role,
        this.emailVerifiedAt,
        this.detail,
        this.braintreeId,
        this.fbUrl,
        this.twitterUrl,
        this.youtubeUrl,
        this.linkedinUrl,
        this.preferPayMethod,
        this.paypalEmail,
        this.paytmMobile,
        this.bankAccName,
        this.bankAccNo,
        this.ifscCode,
        this.bankName,
        this.facebookId,
        this.googleId,
        this.amazonId,
        this.createdAt,
        this.updatedAt,
        this.zoomEmail,
        this.jwtToken,
        this.gitlabId,
        this.linkedinId,
        this.twitterId,
        this.code,
    });

    User copyWith({
        int? id,
        String? fname,
        String? lname,
        dynamic dob,
        dynamic doa,
        dynamic mobile,
        String? email,
        dynamic address,
        dynamic marriedStatus,
        dynamic cityId,
        dynamic stateId,
        dynamic countryId,
        dynamic gender,
        dynamic pinCode,
        String? status,
        String? verified,
        dynamic userImg,
        String? role,
        DateTime? emailVerifiedAt,
        dynamic detail,
        String? braintreeId,
        dynamic fbUrl,
        dynamic twitterUrl,
        dynamic youtubeUrl,
        dynamic linkedinUrl,
        dynamic preferPayMethod,
        dynamic paypalEmail,
        dynamic paytmMobile,
        dynamic bankAccName,
        dynamic bankAccNo,
        dynamic ifscCode,
        dynamic bankName,
        dynamic facebookId,
        dynamic googleId,
        dynamic amazonId,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic zoomEmail,
        dynamic jwtToken,
        dynamic gitlabId,
        dynamic linkedinId,
        dynamic twitterId,
        dynamic code,
    }) => 
        User(
            id: id ?? this.id,
            fname: fname ?? this.fname,
            lname: lname ?? this.lname,
            dob: dob ?? this.dob,
            doa: doa ?? this.doa,
            mobile: mobile ?? this.mobile,
            email: email ?? this.email,
            address: address ?? this.address,
            marriedStatus: marriedStatus ?? this.marriedStatus,
            cityId: cityId ?? this.cityId,
            stateId: stateId ?? this.stateId,
            countryId: countryId ?? this.countryId,
            gender: gender ?? this.gender,
            pinCode: pinCode ?? this.pinCode,
            status: status ?? this.status,
            verified: verified ?? this.verified,
            userImg: userImg ?? this.userImg,
            role: role ?? this.role,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            detail: detail ?? this.detail,
            braintreeId: braintreeId ?? this.braintreeId,
            fbUrl: fbUrl ?? this.fbUrl,
            twitterUrl: twitterUrl ?? this.twitterUrl,
            youtubeUrl: youtubeUrl ?? this.youtubeUrl,
            linkedinUrl: linkedinUrl ?? this.linkedinUrl,
            preferPayMethod: preferPayMethod ?? this.preferPayMethod,
            paypalEmail: paypalEmail ?? this.paypalEmail,
            paytmMobile: paytmMobile ?? this.paytmMobile,
            bankAccName: bankAccName ?? this.bankAccName,
            bankAccNo: bankAccNo ?? this.bankAccNo,
            ifscCode: ifscCode ?? this.ifscCode,
            bankName: bankName ?? this.bankName,
            facebookId: facebookId ?? this.facebookId,
            googleId: googleId ?? this.googleId,
            amazonId: amazonId ?? this.amazonId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            zoomEmail: zoomEmail ?? this.zoomEmail,
            jwtToken: jwtToken ?? this.jwtToken,
            gitlabId: gitlabId ?? this.gitlabId,
            linkedinId: linkedinId ?? this.linkedinId,
            twitterId: twitterId ?? this.twitterId,
            code: code ?? this.code,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        dob: json["dob"],
        doa: json["doa"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        marriedStatus: json["married_status"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        countryId: json["country_id"],
        gender: json["gender"],
        pinCode: json["pin_code"],
        status: json["status"],
        verified: json["verified"],
        userImg: json["user_img"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        detail: json["detail"],
        braintreeId: json["braintree_id"],
        fbUrl: json["fb_url"],
        twitterUrl: json["twitter_url"],
        youtubeUrl: json["youtube_url"],
        linkedinUrl: json["linkedin_url"],
        preferPayMethod: json["prefer_pay_method"],
        paypalEmail: json["paypal_email"],
        paytmMobile: json["paytm_mobile"],
        bankAccName: json["bank_acc_name"],
        bankAccNo: json["bank_acc_no"],
        ifscCode: json["ifsc_code"],
        bankName: json["bank_name"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        amazonId: json["amazon_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        zoomEmail: json["zoom_email"],
        jwtToken: json["jwt_token"],
        gitlabId: json["gitlab_id"],
        linkedinId: json["linkedin_id"],
        twitterId: json["twitter_id"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "dob": dob,
        "doa": doa,
        "mobile": mobile,
        "email": email,
        "address": address,
        "married_status": marriedStatus,
        "city_id": cityId,
        "state_id": stateId,
        "country_id": countryId,
        "gender": gender,
        "pin_code": pinCode,
        "status": status,
        "verified": verified,
        "user_img": userImg,
        "role": role,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "detail": detail,
        "braintree_id": braintreeId,
        "fb_url": fbUrl,
        "twitter_url": twitterUrl,
        "youtube_url": youtubeUrl,
        "linkedin_url": linkedinUrl,
        "prefer_pay_method": preferPayMethod,
        "paypal_email": paypalEmail,
        "paytm_mobile": paytmMobile,
        "bank_acc_name": bankAccName,
        "bank_acc_no": bankAccNo,
        "ifsc_code": ifscCode,
        "bank_name": bankName,
        "facebook_id": facebookId,
        "google_id": googleId,
        "amazon_id": amazonId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "zoom_email": zoomEmail,
        "jwt_token": jwtToken,
        "gitlab_id": gitlabId,
        "linkedin_id": linkedinId,
        "twitter_id": twitterId,
        "code": code,
    };
}
