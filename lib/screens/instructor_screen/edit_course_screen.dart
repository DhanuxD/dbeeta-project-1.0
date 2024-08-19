import '../../utils/imports/import_list.dart';

class UpdateCourseScreen extends StatelessWidget {
  UpdateCourseScreen({super.key});

  final CourseManageController _createCourseController =
      Get.put(CourseManageController());
  final Course courseData = Get.arguments;

  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController courseCategoryController =
      TextEditingController();
  final TextEditingController courseDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    courseTitleController.text = courseData.title ?? '';
    courseCategoryController.text = courseData.category ?? '';
    courseDescriptionController.text = courseData.description ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Course'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48),
              Center(
                child: CustomLabel().customLabel(
                  text: 'Update Course',
                  fontSize: 32,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: courseTitleController,
                decoration: InputDec.inputDec(label: 'Course Title'),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: courseCategoryController,
                decoration: InputDec.inputDec(label: 'Course Category'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: courseDescriptionController,
                decoration: InputDec.inputDec(label: 'Course Description'),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if(courseTitleController.text.isEmpty || courseCategoryController.text.isEmpty || courseDescriptionController.text.isEmpty){
                    Get.snackbar("Error", "Every field cannot be empty",
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 1));
                  }else{
                    _createCourseController.updateCourse(
                      id: courseData.id,
                      courseTitle: courseTitleController.text,
                      courseCategory: courseCategoryController.text,
                      courseDescription: courseDescriptionController.text
                    );
                  }

                },
                child: CustomLabel().customLabel(
                  text: 'Update Course',
                  fontSize: 24,
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
