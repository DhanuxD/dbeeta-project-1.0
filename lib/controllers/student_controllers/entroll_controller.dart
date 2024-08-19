import '../../models/student_model/enrollement_course.dart';
import '../../utils/imports/import_list.dart';

class EnrollController extends GetxController {
  Future<void> enrollCourse({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '';
    var response = await EnrollmentCourse().enrollCourse(token: token, id: id);
    print(response?.data);
    EnrollmentResponse enrollmentResponse =
        EnrollmentResponse.fromJson(response?.data);

    if (response?.statusCode == 201) {
      Get.snackbar("Success", "Course enrolled successfully",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    } else if (enrollmentResponse.message ==
        "You are already enrolled in this course") {
      Get.snackbar("Already Enrolled", enrollmentResponse.message.toString(),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    } else {
      Get.snackbar("Failed", "Course enrollment failed",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    }
  }
}
