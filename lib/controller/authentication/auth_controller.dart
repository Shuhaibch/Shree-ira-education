import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/authentication/login_model.dart';

import '../../models/authentication/signup_model.dart';

class AuthController {
  final String signUpUrl =
      "http://axnoldigitalsolutions.in/Training/api/register";
  final String logInUrl = "http://axnoldigitalsolutions.in/Training/api/login";

  //* Signin
  Future<Map<String, dynamic>> signin({
    required String email,
    required String password,
  }) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    try {
      final response = await http.post(Uri.parse(logInUrl),
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
          body: jsonEncode({"email": email, "password": password}));
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final UserLoginRespModel loginUser =
            UserLoginRespModel.fromJson(jsonDecode(response.body));
        log(loginUser.accessToken);
        await updateToken(loginUser.accessToken);
        return {
          'response': 'success',
          'data': loginUser.user,
        };
      } else {
        // final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Invalid credentials',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Error Occured',
      };
    }
  }

  //*************************************************************************************** */

  //* SignUp
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      print(firstName);
      print(lastName);
      print(password);
      print(email);
      final response = await http.post(
        Uri.parse(signUpUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "fname": firstName,
            "lname": lastName,
            "email": email,
            "password": password,
            "password_confirmation": password
          },
        ),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final SignUpRespModel signUpUser =
            SignUpRespModel.fromJson(jsonDecode(response.body));
        // await updateToken(loginUser.accessToken);
        return {
          'response': 'success',
          'data': signUpUser.user,
        };
      } else if (response.statusCode == 400) {
        try {
          final res = jsonDecode(response.body);

          return {
            'response': 'error',
            'message': '${res['email']}',
          };
        } catch (e) {
          return {
            'response': 'error',
            'message': 'Server error: ${response.statusCode}',
          };
        }
      } else {
        return {
          'response': 'error',
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      log(e.toString());
      return {
        'response': 'error',
        'message': 'Server error: ${e.toString()}',
      };
    }
  }

  updateToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
