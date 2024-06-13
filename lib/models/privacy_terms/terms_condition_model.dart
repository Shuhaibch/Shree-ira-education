// To parse this JSON data, do
//
//     final termsConditionModel = termsConditionModelFromJson(jsonString);

import 'dart:convert';

TermsConditionRespModel termsConditionModelFromJson(String str) => TermsConditionRespModel.fromJson(json.decode(str));

String termsConditionModelToJson(TermsConditionRespModel data) => json.encode(data.toJson());

class TermsConditionRespModel {
    String? message;
    List<TermsCondition>? termsCondition;

    TermsConditionRespModel({
        this.message,
        this.termsCondition,
    });

    TermsConditionRespModel copyWith({
        String? message,
        List<TermsCondition>? termsCondition,
    }) => 
        TermsConditionRespModel(
            message: message ?? this.message,
            termsCondition: termsCondition ?? this.termsCondition,
        );

    factory TermsConditionRespModel.fromJson(Map<String, dynamic> json) => TermsConditionRespModel(
        message: json["message"],
        termsCondition: json["terms_condition"] == null ? [] : List<TermsCondition>.from(json["terms_condition"]!.map((x) => TermsCondition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "terms_condition": termsCondition == null ? [] : List<dynamic>.from(termsCondition!.map((x) => x.toJson())),
    };
}

class TermsCondition {
    int? id;
    String? termTitle;
    String? termDescription;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? terms;
    String? policy;

    TermsCondition({
        this.id,
        this.termTitle,
        this.termDescription,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.terms,
        this.policy,
    });

    TermsCondition copyWith({
        int? id,
        String? termTitle,
        String? termDescription,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? terms,
        String? policy,
    }) => 
        TermsCondition(
            id: id ?? this.id,
            termTitle: termTitle ?? this.termTitle,
            termDescription: termDescription ?? this.termDescription,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            terms: terms ?? this.terms,
            policy: policy ?? this.policy,
        );

    factory TermsCondition.fromJson(Map<String, dynamic> json) => TermsCondition(
        id: json["id"],
        termTitle: json["term_title"],
        termDescription: json["term_description"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        terms: json["terms"],
        policy: json["policy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "term_title": termTitle,
        "term_description": termDescription,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "terms": terms,
        "policy": policy,
    };
}
