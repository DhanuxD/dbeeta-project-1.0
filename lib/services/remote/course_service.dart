import 'package:dio/dio.dart';
import '../../constant/const.dart';

class CourseService {
  final dio = Dio();

  Future<Response> getAllCourses(String token) async {
    print('Getting courses... ---------------->Services');

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
      print(e);
      return Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
    }
  }
}
