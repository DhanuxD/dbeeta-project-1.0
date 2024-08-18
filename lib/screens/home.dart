import '../utils/imports/import_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController _authController = Get.put(LoginController());
  final CoursesController _coursesController = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: CustomLabel().customLabel(
                text: 'D-Beeta Academy',
                fontSize: 24,
                color: Colors.blueAccent),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) async {
                if (value == 0) {
                  await _coursesController.getAllCourses();
                } else if (value == 1) {}
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Text("My Account"),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text("Courses"),
                ),
              ],
              icon: const Icon(Icons.more_vert),
            ),
            IconButton(
              onPressed: () async {
                _authController.logoutUser();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Obx(
          () {
            if (_coursesController.courses.isEmpty) {
              return const Center(
                child: Text(
                  'No courses available.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _coursesController.courses.length,
              itemBuilder: (context, index) {
                final course = _coursesController.courses[index];
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabel().customLabel(
                          text: course.title ?? 'No Title',
                          fontSize: 24.0,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.category,
                                size: 20, color: Colors.cyan),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: CustomLabel().customLabel(
                                text: course.category ?? 'No category',
                                fontSize: 20.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.person,
                                size: 20, color: Colors.cyan),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: CustomLabel().customLabel(
                                text:
                                    'Instructor: ${course.instructor.name ?? 'Unknown'}',
                                fontSize: 18.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        CustomLabel().customLabel(
                          text: 'Description:',
                          fontSize: 16.0,
                          color: Colors.deepOrangeAccent,
                        ),
                        const SizedBox(height: 4.0),
                        CustomLabel().customLabel(
                          text: course.description ?? 'No Description',
                          fontSize: 14.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 12.0),
                        CustomLabel().customLabel(
                          text: 'Lessons:',
                          fontSize: 16.0,
                          color: Colors.deepOrangeAccent,
                        ),
                        ...course.lessons.map(
                          (lesson) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                const Icon(Icons.book,
                                    size: 18, color: Colors.cyan),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: CustomLabel().customLabel(
                                    text: lesson.title ?? 'No Title',
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
