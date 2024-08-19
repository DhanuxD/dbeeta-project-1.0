import 'package:dio/dio.dart';
import '../../../constant/const.dart';

class EnrollmentCourse {
  final dio = Dio();

  Future<Response?> enrollCourse(
      {required String token, required int id}) async {
    try {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      return await dio.post(
        '${Const.BASE_URL}/courses/$id/enroll',
        options: Options(headers: header),
      );
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      return Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
    }
  }
}
