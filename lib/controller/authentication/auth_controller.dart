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

  // Future<Map<String, dynamic>> signup({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String password,
  //   required String passwordConfirmation,
  //   required String location,
  //   required String address,
  //   required String image,
  // }) async {
  //   // var bytes = utf8.encode(image);
  //   // var image64Str = base64.encode(bytes);
  //   try {
  //     final response = await http.post(
  //       Uri.parse(signupUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'name': name,
  //         'email': email,
  //         'phone': phone,
  //         'password': password,
  //         'password_confirmation': passwordConfirmation,
  //         'location': location,
  //         'address': address,
  //         'profile_image': image
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final SignUpUser signUpUser =
  //           SignUpUser.fromJson(jsonDecode(response.body));
  //       await updateToken(signUpUser.data.token);
  //       return {
  //         'response': 'success',
  //         'data': signUpUser.data.user,
  //       };
  //     } else if (response.statusCode == 422) {
  //       log(response.body.toString());
  //       final SignUpError error =
  //           SignUpError.fromJson(jsonDecode(response.body));
  //       List<String>? errorList;
  //       errorList!.add(error.errors.email[0]);
  //       errorList.add(error.errors.password[0]);
  //       errorList.add(error.errors.phone[0]);
  //       errorList.add(error.errors.name[0]);
  //       return {
  //         'response': '422',
  //         'message': errorList,
  //       };
  //     } else {
  //       return {
  //         'response': 'error',
  //         'message': 'Server error: ${response.statusCode}',
  //       };
  //     }
  //   } catch (e) {
  //     return {
  //       'response': 'error',
  //       'message': 'Server error: ${e.toString()}',
  //     };
  //   }
  // }

  //* Signin
  Future<Map<String, dynamic>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(logInUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        final UserLoginRespModel loginUser =
            UserLoginRespModel.fromJson(jsonDecode(response.body));
        await updateToken(loginUser.accessToken);
        return {
          'response': 'success',
          'data': loginUser.user,
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

  //*************************************************************************************** */

  //* SignUp
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
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
