import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/cart/cart_model.dart';

class CartController {
  final String addToCartUrl =
      "http://axnoldigitalsolutions.in/Training/api/addtocart";
  final String getCartCourseUrl =
      "http://axnoldigitalsolutions.in/Training/api/show/cart";
  final String deleteCartCourseUrl =
      "http://axnoldigitalsolutions.in/Training/api/remove/cart";
  final String checkOutUrl =
      "http://axnoldigitalsolutions.in/Training/api/check-out";

  //* Signin
  Future<Map<String, dynamic>> addToCart({
    required String courseId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(addToCartUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"course_id": courseId}),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        // final CategoriesRespModel categoryResp =
        //     CategoriesRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': jsonDecode(response.body),
        };
      } else {
        // final resp = jsonDecode(response.body);
        return {
          'response': 'already In cart',
          'message': 'Error While Loading Categories',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Error While Loading Categories',
      };
    }
  }

  //*************************************************************************************** */

  Future<Map<String, dynamic>> getCartCourses() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(getCartCourseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final CartRespModel cartResp =
            CartRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': cartResp.cart,
        };
      } else {
        // final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Error While Loading Categories',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Error While Loading Categories',
      };
    }
  }

  //*************************************************************************************** */
  //*************************************************************************************** */

  Future<Map<String, dynamic>> deleteCartCourses(
      {required String courseId}) async {
    try {
      log(courseId);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(deleteCartCourseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"course_id": courseId}),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());

        return {
          'response': 'success',
          'data': '',
        };
      } else {
        // final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Error While Deleting ',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Error While Deleting',
      };
    }
  }

  //*************************************************************************************** */
  //*************************************************************************************** */

  Future<Map<String, dynamic>> courseCheckOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(checkOutUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'response': 'success',
          'data': '',
        };
      } else {
        // final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Error While Loading Categories',
        };
      }
    } catch (e) {
      print(e);
      return {
        'response': 'error',
        'message': 'Error While Loading Categories',
      };
    }
  }
}
