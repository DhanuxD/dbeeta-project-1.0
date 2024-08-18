import '../../utils/imports/import_list.dart';

class CoursesDetailsScreen extends StatelessWidget {
  CoursesDetailsScreen({super.key});

  final CustomLabel customLabel = CustomLabel();

  @override
  Widget build(BuildContext context) {
    final int courseId = Get.arguments;
    final GetCourseDetails courseController =
        Get.put(GetCourseDetails(id: courseId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (courseController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (courseController.hasError.value) {
            return const Center(
                child: Text("Error loading data. Please try again."));
          } else if (courseController.course.value == null) {
            return const Center(child: Text("No course details available."));
          } else {
            Course course = courseController.course.value!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --------------> Course Details <----------------//
                    customLabel.customLabel(
                      text: course.title,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    //-------------------> Category <-------------------//
                    customLabel.customLabel(
                        text: course.category.toUpperCase(),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent),
                    const SizedBox(height: 20),
                    //-----------------> Description <-------------------//
                    customLabel.customLabel(
                      text: course.description,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(height: 20),

                    // --------------> Instructor Details <----------------//
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customLabel.customLabel(
                              text: 'Instructor Details',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[300],
                            ),
                            const Divider(color: Colors.blue),
                            const SizedBox(height: 8),
                            customLabel.customLabel(
                              text: 'Name: ${course.instructor.name}',
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                            const SizedBox(height: 5),
                            customLabel.customLabel(
                              text: 'Role: ${course.instructor.role}',
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                            const SizedBox(height: 5),
                            customLabel.customLabel(
                              text: 'Email: ${course.instructor.email}',
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                            const SizedBox(height: 5),
                            customLabel.customLabel(
                              text:
                                  'Email Verified At: ${course.instructor.emailVerifiedAt ?? "Not verified"}',
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    customLabel.customLabel(
                      text: 'Lessons',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 10),
                    // ----------------> Lesson List <-------------------//
                    if (course.lessons.isNotEmpty)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: course.lessons.length,
                              itemBuilder: (context, index) {
                                final lesson = course.lessons[index];
                                return Card(
                                  elevation: 2,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    title: customLabel.customLabel(
                                      text: lesson.title,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    else
                      customLabel.customLabel(
                        text: 'No lessons available for this course.',
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
