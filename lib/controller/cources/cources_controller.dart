import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/models/courses/courses_model.dart';

class CourseController {
  final String getCourseUrl =
      "http://axnoldigitalsolutions.in/Training/api/course";
  final String getSubCategoriesUrl =
      "http://axnoldigitalsolutions.in/Training/api/sub-category";
  final String getCourseByIdUrl =
      "http://axnoldigitalsolutions.in/Training/api/course-by-id";

  //* Get All courses
  Future<Map<String, dynamic>> getAllCourse({
    required String subCategoryId,
    required String categoryId,
  }) async {
    log(categoryId);
    log(subCategoryId);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(getCourseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "category_id": categoryId,
          "subcategory_id": subCategoryId,
        }),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final CoursesRespModel coursesRespModel =
            CoursesRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': coursesRespModel.courses,
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

  Future<Map<String, dynamic>> getFilteredCourse({
    required String subCategoryId,
    required String categoryId,
    required String sortBy,
    required String priceType,
  }) async {
    log(categoryId);
    log(priceType);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(getCourseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "category_id": categoryId,
          "subcategory_id": subCategoryId,
          "price_type": priceType,
          "sort_by": sortBy,
        }),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final CoursesRespModel coursesRespModel =
            CoursesRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': coursesRespModel.courses,
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

  Future<Map<String, dynamic>> getCourseById({
    required String courseId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse(getCourseByIdUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "course_id": courseId,
        }),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        final CoursesByIDRespModel coursesRespModel =
            CoursesByIDRespModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': coursesRespModel.course,
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
