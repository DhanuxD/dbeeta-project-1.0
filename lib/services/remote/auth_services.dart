import 'package:dio/dio.dart';
import '../../utils/imports/import_list.dart';

class AuthServices {
  final dio = Dio();

  //------------------------>User register<----------------//
  Future<int?> registerUser(
      {required String name,
      required String email,
      required String password,
      required String role}) async {
    try {
      final response = await dio.post('${Const.BASE_URL}/register', data: {
        'name': name,
        'email': email,
        'password': password,
        'role': role,
      });

      // final Map<String, dynamic> data = response.data;
      print('Response token: ${response.data['token']}');

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(
            'Getting token before saving: ${prefs.getString(Special.LOGIN_TOKEN.toString())}');
        prefs.setString(Special.LOGIN_TOKEN.toString(), response.data['token']);
        print('Getting token after saving: ${response.data['token']}');
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

  //------------------------>User Login<----------------//
  Future<int?> loginUser(
      {required String email, required String password}) async {
    try {
      print('Sending data to the server---------------->');
      print('Email: $email');
      print('Password: $password');

      final response = await dio.post('${Const.BASE_URL}/login', data: {
        'email': email,
        'password': password,
      });

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

  //------------------------>User Logout<----------------//
  Future<int?> logoutUser(String token) async {
    try {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      final response = await dio.post(
        '${Const.BASE_URL}/logout',
        options: Options(headers: header),
      );

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        return dioError.response?.statusCode;
      } else {
        print('DioError without response: ${dioError.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  Future<void> getAllCourses() async {
    final response = await dio
        .get('https://festive-clarke.93-51-37-244.plesk.page/api/v1/courses');
    print(response.data);
  }
}
