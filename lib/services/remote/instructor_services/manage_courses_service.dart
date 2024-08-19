import 'package:dio/dio.dart';
import '../../../constant/const.dart';

class ManageCoursesService {
  final dio = Dio();

  Future<Response?> createCourse(
      {required String courseName,
      required String courseCategory,
      required String courseDescription,
      required String token}) async {
    var data = {
      "title": courseName,
      "category": courseCategory,
      "description": courseDescription
    };
    print('Tokebn-------------------------->: $token');
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print(data);
    try {
      var response = await dio.post('${Const.BASE_URL}/courses',
          data: data, options: Options(headers: header));
      print('Create course ---------->: $response');
      print('Create course status code ---------->: ${response.statusCode}');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError: ${e.response?.data}');
        return e.response;
      } else {
        print('DioError without response: ${e.message}');
        return Response(
          requestOptions: e.requestOptions,
          statusCode: 500,
          statusMessage: e.message,
          data: {'error': 'Network or server issue', 'details': e.message},
        );
      }
    } catch (e) {
      print('Unexpected error: $e');
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error',
        data: {
          'error': 'An unexpected error occurred',
          'details': e.toString()
        },
      );
    }
  }

  //--------------------->Delete course <---------------------//

  Future<Response?> deleteCourse(
      {required int id, required String token}) async {
    try {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var response = await dio.delete('${Const.BASE_URL}/courses/$id',
          options: Options(headers: header));
      print('Delete course ---------->: $response');
      print('Delete course status code ---------->: ${response.statusCode}');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError: ${e.response?.data}');
        return e.response;
      } else {
        print('DioError without response: ${e.message}');
        return Response(
          requestOptions: e.requestOptions,
          statusCode: 500,
          statusMessage: e.message,
          data: {'error': 'Network or server issue', 'details': e.message},
        );
      }
    } catch (e) {
      print('Unexpected error: $e');
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error',
        data: {
          'error': 'An unexpected error occurred',
          'details': e.toString()
        },
      );
    }
    // final response =  await  dio.delete('${Const.BASE_URL}/courses/$id',);
  }
}
