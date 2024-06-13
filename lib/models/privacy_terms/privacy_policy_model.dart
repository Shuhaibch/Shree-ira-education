
import 'dart:convert';

PrivacyPolicyRespModel privacyPolicyRespModelFromJson(String str) => PrivacyPolicyRespModel.fromJson(json.decode(str));

String privacyPolicyRespModelToJson(PrivacyPolicyRespModel data) => json.encode(data.toJson());

class PrivacyPolicyRespModel {
    String? message;
    List<Policy>? policy;

    PrivacyPolicyRespModel({
        this.message,
        this.policy,
    });

    PrivacyPolicyRespModel copyWith({
        String? message,
        List<Policy>? policy,
    }) => 
        PrivacyPolicyRespModel(
            message: message ?? this.message,
            policy: policy ?? this.policy,
        );

    factory PrivacyPolicyRespModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyRespModel(
        message: json["message"],
        policy: json["policy"] == null ? [] : List<Policy>.from(json["policy"]!.map((x) => Policy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "policy": policy == null ? [] : List<dynamic>.from(policy!.map((x) => x.toJson())),
    };
}

class Policy {
    int? id;
    String? policyTitle;
    String? policyDescription;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Policy({
        this.id,
        this.policyTitle,
        this.policyDescription,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    Policy copyWith({
        int? id,
        String? policyTitle,
        String? policyDescription,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Policy(
            id: id ?? this.id,
            policyTitle: policyTitle ?? this.policyTitle,
            policyDescription: policyDescription ?? this.policyDescription,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Policy.fromJson(Map<String, dynamic> json) => Policy(
        id: json["id"],
        policyTitle: json["policy_title"],
        policyDescription: json["policy_description"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "policy_title": policyTitle,
        "policy_description": policyDescription,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
