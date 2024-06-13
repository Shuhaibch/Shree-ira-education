import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/privacy_terms/privacy_policy_model.dart';
import 'package:shreeiraeducation/models/privacy_terms/terms_condition_model.dart';

class TermsAndConditionController {
  final String getTermAndConditionUrl =
      "http://axnoldigitalsolutions.in/Training/api/terms_condition";
  final String getPrivacyPolicyUrl =
      "http://axnoldigitalsolutions.in/Training/api/policy";

  Future<Map<String, dynamic>> getTermsAndConditions() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(getTermAndConditionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        final TermsConditionRespModel terms =
            TermsConditionRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': terms.termsCondition![0],
        };
      } else {
        final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Server error: ${resp['error']}',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Server error: ${e.toString()}',
      };
    }
  }

  Future<Map<String, dynamic>> getPrivacyPolicy() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(getPrivacyPolicyUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        final PrivacyPolicyRespModel policy =
            PrivacyPolicyRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': policy.policy![0],
        };
      } else {
        final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Server error: ${resp['error']}',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Server error: ${e.toString()}',
      };
    }
  }
}
