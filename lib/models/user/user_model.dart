

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String message;
    User user;

    UserModel({
        required this.message,
        required this.user,
    });

    UserModel copyWith({
        String? message,
        User? user,
    }) => 
        UserModel(
            message: message ?? this.message,
            user: user ?? this.user,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String fname;
    String lname;
    String? dob;
    String? doa;
    String? mobile;
    String email;
    String? address;
    String? marriedStatus;
    String? cityId;
    String? stateId;
    String? countryId;
    String? gender;
    String? pinCode;
    String status;
    String verified;
    String? userImg;
    String role;
    String? emailVerifiedAt;
    String? detail;
    String braintreeId;
    String? fbUrl;
    String? twitterUrl;
    String? youtubeUrl;
    String? linkedinUrl;
    String? preferPayMethod;
    String? paypalEmail;
    String? paytmMobile;
    String? bankAccName;
    String? bankAccNo;
    String? ifscCode;
    String? bankName;
    String? facebookId;
    String? googleId;
    String? amazonId;
    DateTime createdAt;
    DateTime updatedAt;
    String? zoomEmail;
    String? jwtToken;
    String? gitlabId;
    String? linkedinId;
    String? twitterId;
    String? code;

    User({
        required this.id,
        required this.fname,
        required this.lname,
        required this.dob,
        required this.doa,
        required this.mobile,
        required this.email,
        required this.address,
        required this.marriedStatus,
        required this.cityId,
        required this.stateId,
        required this.countryId,
        required this.gender,
        required this.pinCode,
        required this.status,
        required this.verified,
        required this.userImg,
        required this.role,
        required this.emailVerifiedAt,
        required this.detail,
        required this.braintreeId,
        required this.fbUrl,
        required this.twitterUrl,
        required this.youtubeUrl,
        required this.linkedinUrl,
        required this.preferPayMethod,
        required this.paypalEmail,
        required this.paytmMobile,
        required this.bankAccName,
        required this.bankAccNo,
        required this.ifscCode,
        required this.bankName,
        required this.facebookId,
        required this.googleId,
        required this.amazonId,
        required this.createdAt,
        required this.updatedAt,
        required this.zoomEmail,
        required this.jwtToken,
        required this.gitlabId,
        required this.linkedinId,
        required this.twitterId,
        required this.code,
    });

    User copyWith({
        int? id,
        String? fname,
        String? lname,
        String? dob,
        String? doa,
        String? mobile,
        String? email,
        String? address,
        String? marriedStatus,
        String? cityId,
        String? stateId,
        String? countryId,
        String? gender,
        String? pinCode,
        String? status,
        String? verified,
        String? userImg,
        String? role,
        String? emailVerifiedAt,
        String? detail,
        String? braintreeId,
        String? fbUrl,
        String? twitterUrl,
        String? youtubeUrl,
        String? linkedinUrl,
        String? preferPayMethod,
        String? paypalEmail,
        String? paytmMobile,
        String? bankAccName,
        String? bankAccNo,
        String? ifscCode,
        String? bankName,
        String? facebookId,
        String? googleId,
        String? amazonId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? zoomEmail,
        String? jwtToken,
        String? gitlabId,
        String? linkedinId,
        String? twitterId,
        String? code,
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
        emailVerifiedAt: json["email_verified_at"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "email_verified_at": emailVerifiedAt,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "zoom_email": zoomEmail,
        "jwt_token": jwtToken,
        "gitlab_id": gitlabId,
        "linkedin_id": linkedinId,
        "twitter_id": twitterId,
        "code": code,
    };
}
