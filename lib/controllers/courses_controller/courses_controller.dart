import '../../utils/imports/import_list.dart';

class CoursesController extends GetxController {
  var courses = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCourses();
  }

  Future<void> getAllCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final responseFromService = await CourseService()
        .getAllCourses(prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
    if (responseFromService.statusCode == 200) {
      List<Course> coursesList = (responseFromService.data as List)
          .map((courseJson) => Course.fromJson(courseJson))
          .toList();
      courses.clear();
      courses.value = coursesList;
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

class GetCourseDetails extends GetxController {
  int id;
  var course = Rx<Course?>(null); // Observable for a single Course object
  var isLoading = true.obs;
  var hasError = false.obs;

  GetCourseDetails({required this.id});

  @override
  void onInit() {
    super.onInit();
    getCourseDetails(id: id);
  }

  Future<void> getCourseDetails({required int id}) async {
    isLoading.value = true;
    hasError.value = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final responseFromService = await CourseService().getCourseDetails(
        id: id, token: prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
    if (responseFromService.statusCode == 200) {
      course.value = Course.fromJson(responseFromService.data);
    } else if (responseFromService.statusCode == 500) {
      Get.snackbar(
        "Failed",
        "Data retrieval failed with error code: 500",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
      );
      hasError.value = true;
    } else {
      Get.snackbar("Failed", "Check your internet connection",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
      hasError.value = true;
    }
    isLoading.value = false;
  }
}
