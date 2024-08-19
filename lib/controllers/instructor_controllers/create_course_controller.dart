import 'package:learning_management_systemo_v01/services/remote/instructor_services/manage_courses_service.dart';
import '../../models/user_model.dart';
import '../../utils/imports/import_list.dart';

class CreateCourseController extends GetxController {
  final courseNameController = TextEditingController();
  final courseCategoryController = TextEditingController();
  final courseDescriptionController = TextEditingController();
  var isCreating = false.obs;
  var courses = <dynamic>[].obs;


  @override
  void onInit() {
    super.onInit();
    getAllCoursesByInstructor();
  }

  Future<void> createCourse() async {
    final courseName = courseNameController.text.trim();
    final courseCategory = courseCategoryController.text.trim();
    final courseDescription = courseDescriptionController.text.trim();
    if (courseName.isEmpty ||
        courseCategory.isEmpty ||
        courseDescription.isEmpty) {
      Get.snackbar("Error", "Every field cannot be empty",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3));
    } else {
      isCreating.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '';
      var response = await ManageCoursesService().createCourse(
          courseName: courseNameController.text,
          courseCategory: courseCategoryController.text,
          courseDescription: courseDescriptionController.text,
          token: token);

      if (response?.statusCode == 201) {
        isCreating.value = false;
        courseDescriptionController.text = '';
        courseNameController.text = '';
        courseCategoryController.text = '';
        Get.snackbar("Success", "Course created successfully",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      } else {
        isCreating.value = false;
        Get.snackbar("Failed", "Course creation failed",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      }
    }
  }

  Future<void> getAllCoursesByInstructor() async {
    print('All courses by instuctor:--------------------------------------');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await AuthServices().getUserIdentity(
        token: prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
    UserModel user = UserModel.fromJson(response!);
    final responseFromService = await CourseService()
        .getAllCourses(prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
    if (responseFromService.statusCode == 200) {
      List<Course> coursesList = (responseFromService.data as List)
          .map((courseJson) => Course.fromJson(courseJson))
          .toList();
      courses.clear();
      // courses.value = coursesList;
      print('All courses: $coursesList');
      courses.value =
          coursesList.where((course) => course.instructor.id == user.id).toList();
    } else if (responseFromService.statusCode == 500) {
      Get.snackbar(
        "Failed",
        "Data retrieval failed with error code: 500",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        "Failed",
        "Check your internet connection",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
      );
    }
  }
}
