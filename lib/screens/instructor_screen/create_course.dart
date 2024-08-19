import 'package:learning_management_systemo_v01/controllers/instructor_controllers/course_manage_controller.dart';

import '../../utils/imports/import_list.dart';

class CreateCourseScreen extends StatelessWidget {
  CreateCourseScreen({super.key});

  CourseManageController createCourseController =
      Get.put(CourseManageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48),
              Center(
                child: CustomLabel().customLabel(
                  text: 'Create Course',
                  fontSize: 32,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: createCourseController.courseNameController,
                decoration: InputDec.inputDec(label: 'course name'),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: createCourseController.courseCategoryController,
                decoration: InputDec.inputDec(label: 'course category'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: createCourseController.courseDescriptionController,
                decoration: InputDec.inputDec(label: 'course description'),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              Obx(
                () {
                  return createCourseController.isCreating.value
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            createCourseController.createCourse();
                          },
                          child: CustomLabel().customLabel(
                            text: 'Create Course',
                            fontSize: 24,
                            color: Colors.lightBlue,
                          ),
                        );
                },
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     print('Send the data ---------------->');
              //     createCourseController.createCourse();
              //   },
              //   child: CustomLabel().customLabel(
              //     text: 'Create Course',
              //     fontSize: 24,
              //     color: Colors.lightBlue,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
