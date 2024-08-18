import 'package:dio/dio.dart';
import '../../../constant/const.dart';

class CourseService {
  final dio = Dio();

  Future<Response> getAllCourses(String token) async {
    try {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      return await dio.get(
        '${Const.BASE_URL}/courses',
        options: Options(headers: header),
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
    }
  }

  Future<Response> getCourseDetails(
      {required String token, required int id}) async {
    try {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      return await dio.get(
        '${Const.BASE_URL}/courses/$id',
        options: Options(headers: header),
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
    }
  }
}
