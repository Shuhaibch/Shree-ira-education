import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';

class CategoryController {
  final String getCategoriesUrl =
      "http://axnoldigitalsolutions.in/Training/api/category";
  final String getSubCategoriesUrl =
      "http://axnoldigitalsolutions.in/Training/api/sub-category";

  //* Signin
  Future<Map<String, dynamic>> getAllCategories() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(getCategoriesUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final CategoriesRespModel categoryResp =
            CategoriesRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': categoryResp.categories,
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

  Future<Map<String, dynamic>> getSubCategories() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(getSubCategoriesUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final SubCategoriesRespModel categoryResp =
            SubCategoriesRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': categoryResp.subCategories,
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
}
