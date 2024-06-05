// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpRespModel signUpModelFromJson(String str) => SignUpRespModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpRespModel data) => json.encode(data.toJson());

class SignUpRespModel {
    String message;
    User user;

    SignUpRespModel({
        required this.message,
        required this.user,
    });

    SignUpRespModel copyWith({
        String? message,
        User? user,
    }) => 
        SignUpRespModel(
            message: message ?? this.message,
            user: user ?? this.user,
        );

    factory SignUpRespModel.fromJson(Map<String, dynamic> json) => SignUpRespModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    String fname;
    String lname;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    User({
        required this.fname,
        required this.lname,
        required this.email,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    User copyWith({
        String? fname,
        String? lname,
        String? email,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
    }) => 
        User(
            fname: fname ?? this.fname,
            lname: lname ?? this.lname,
            email: email ?? this.email,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
