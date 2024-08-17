import 'package:learning_management_systemo_v01/enums/special.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../constant/const.dart';

class AuthServices {
  final dio = Dio();

  Future<int?> registerUser(
      {required String name,
      required String email,
      required String password,
      required String role}) async {
    try {
      final response = await dio.post(
          '${Const.BASE_URL}/register',
          data: {
            'name': name,
            'email': email,
            'password': password,
            'role': role,
          });

      // final Map<String, dynamic> data = response.data;
      print('Response token: ${response.data['token']}');

      if (response.statusCode == 201) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print('DioError: ${dioError.response?.data}');
        print('Status code: ${dioError.response?.statusCode}');
        return dioError.response?.statusCode;
      } else {
        print('DioError without response: ${dioError.message}');
      }
    } catch (e) {
      // Handle other types of exceptions
      print('Unexpected error: $e');
    }
  }

  Future<int?> loginUser(
      {required String email, required String password}) async {
    try {
      print('Sending data to the server---------------->');
      print('Email: $email');
      print('Password: $password');

      final response = await dio.post(
          '${Const.BASE_URL}/login',
          data: {
            'email': email,
            'password': password,
          });

      print('My login ---------------->Response data: ${response.data['token']}');

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(Special.LOGIN_TOKEN.toString(), response.data['token']);
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print('DioError: ${dioError.response?.data}');
        print('Status code: ${dioError.response?.statusCode}');
        return dioError.response?.statusCode;
      } else {
        print('DioError without response: ${dioError.message}');
      }
    } catch (e) {
      // Handle other types of exceptions
      print('Unexpected error: $e');
    }
  }

  Future<int?> logoutUser() async {
    try {
      print('Sending data to the server---------------->');
      // print('Email: $email');
      // print('Password: $password');

      final response = await dio.post(
        '${Const.BASE_URL}/logout',
      );

      print('My logout ---------------->Response data: ${response.data}');
      print('My ---------------->Response data: ${response}');

      if (response.statusCode == 200) {
        print('Registration successful');
        print('Response data: ${response.statusCode}');
        return response.statusCode;
      } else {
        print('Failed to register: ${response.statusCode}');
        print('Failed to register: ${response}');
        return response.statusCode;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print('DioError: ${dioError.response?.data}');
        print('Status code: ${dioError.response?.statusCode}');
        return dioError.response?.statusCode;
      } else {
        print('DioError without response: ${dioError.message}');
      }
    } catch (e) {
      // Handle other types of exceptions
      print('Unexpected error: $e');
    }
  }

  Future<void> getAllCourses() async {
    final response = await dio
        .get('https://festive-clarke.93-51-37-244.plesk.page/api/v1/courses');
    print(response.data);
  }
}
