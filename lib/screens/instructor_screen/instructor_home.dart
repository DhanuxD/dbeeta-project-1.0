// import '../../utils/imports/import_list.dart';
//
// class InstructorHomeScreen extends StatelessWidget {
//   InstructorHomeScreen({super.key});
//
//   final LoginController _authController = Get.put(LoginController());
//   final CourseManageController _createCourseController =
//       Get.put(CourseManageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: CustomLabel().customLabel(
//               text: 'D-Beeta Instructor',
//               fontSize: 24,
//               color: Colors.blueAccent,
//             ),
//           ),
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           actions: [
//             PopupMenuButton<int>(
//               onSelected: (value) async {
//                 if (value == 0) {
//                   Get.toNamed(Routes.CREATE_COURSE);
//                 } else if (value == 1) {}
//               },
//               itemBuilder: (context) => [
//                 const PopupMenuItem(
//                   value: 0,
//                   child: Text("Create Course"),
//                 ),
//                 const PopupMenuItem(
//                   value: 1,
//                   child: Text("Courses"),
//                 ),
//               ],
//               icon: const Icon(Icons.more_vert),
//             ),
//             IconButton(
//               onPressed: () async {
//                 _authController.logoutUser();
//               },
//               icon: const Icon(Icons.logout),
//             ),
//           ],
//         ),
//         body: Obx(
//           () {
//             if (_createCourseController.courses.isEmpty) {
//               return const Center(
//                 child: Text(
//                   'No courses available.',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.grey,
//                   ),
//                 ),
//               );
//             }
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: _createCourseController.courses.length,
//                     itemBuilder: (context, index) {
//                       final course = _createCourseController.courses[index];
//                       return GestureDetector(
//                         onTap: () async {
//                           SharedPreferences prefs =
//                               await SharedPreferences.getInstance();
//                           prefs.setString('courseId', course.id.toString());
//                           Get.toNamed(Routes.COURSE_DETAILS,
//                               arguments: course.id);
//                         },
//                         child: Stack(
//                           children: [
//                             Card(
//                               color: Colors.white,
//                               elevation: 4.0,
//                               margin: const EdgeInsets.symmetric(vertical: 8.0),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12.0),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomLabel().customLabel(
//                                       text: course.title ?? 'No Title',
//                                       fontSize: 20.0,
//                                       color: Colors.blueAccent,
//                                     ),
//                                     const SizedBox(height: 8.0),
//                                     Row(
//                                       children: [
//                                         const Icon(Icons.category,
//                                             size: 16, color: Colors.cyan),
//                                         const SizedBox(width: 4.0),
//                                         Expanded(
//                                           child: CustomLabel().customLabel(
//                                             text: course.category ??
//                                                 'No category',
//                                             fontSize: 16.0,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 8.0),
//                                     Row(
//                                       children: [
//                                         const Icon(Icons.person,
//                                             size: 20, color: Colors.cyan),
//                                         const SizedBox(width: 4.0),
//                                         Expanded(
//                                           child: CustomLabel().customLabel(
//                                             text:
//                                                 'Instructor: ${course.instructor.name ?? 'Unknown'}',
//                                             fontSize: 14.0,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 8.0),
//                                     // ...course.lessons.map(
//                                     //   (lesson) => Padding(
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         vertical: 4.0),
//                                     //     child: Row(
//                                     //       children: [
//                                     //         const Icon(Icons.book,
//                                     //             size: 18, color: Colors.cyan),
//                                     //         const SizedBox(width: 8.0),
//                                     //         Expanded(
//                                     //           child: CustomLabel().customLabel(
//                                     //             text: lesson.title ?? 'No Title',
//                                     //             fontSize: 16.0,
//                                     //             color: Colors.black45,
//                                     //             fontWeight: FontWeight.w100,
//                                     //           ),
//                                     //         ),
//                                     //       ],
//                                     //     ),
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 16),
//                                     child: IconButton(
//                                       onPressed: () {
//                                         _createCourseController
//                                             .deleteCourse(course.id);
//                                       },
//                                       icon: const Icon(
//                                         Icons.delete,
//                                         size: 32,
//                                         color: Colors.redAccent,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 16),
//                                     child: IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.edit,
//                                         size: 32,
//                                         color: Colors.blueAccent,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import '../../utils/imports/import_list.dart';

class InstructorHomeScreen extends StatelessWidget {
  InstructorHomeScreen({super.key});

  final LoginController _authController = Get.put(LoginController());
  final CourseManageController _createCourseController =
  Get.put(CourseManageController());

  //------------------>Get all Courses by refreshing <------------------//
  Future<void> _refreshCourses() async {
    await _createCourseController.getAllCoursesByInstructor();
  }

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
              text: 'D-Beeta Instructor',
              fontSize: 24,
              color: Colors.blueAccent,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) async {
                if (value == 0) {
                  Get.toNamed(Routes.CREATE_COURSE);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Text("Create Course"),
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
            if (_createCourseController.courses.isEmpty) {
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
            return RefreshIndicator(
              onRefresh: _refreshCourses, // Method to call on pull-to-refresh
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _createCourseController.courses.length,
                itemBuilder: (context, index) {
                  final course = _createCourseController.courses[index];
                  return GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setString('courseId', course.id.toString());
                      Get.toNamed(Routes.COURSE_DETAILS,
                          arguments: course.id);
                    },
                    child: Stack(
                      children: [
                        Card(
                          color: Colors.white,
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
                                  fontSize: 20.0,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    const Icon(Icons.category,
                                        size: 16, color: Colors.cyan),
                                    const SizedBox(width: 4.0),
                                    Expanded(
                                      child: CustomLabel().customLabel(
                                        text: course.category ??
                                            'No category',
                                        fontSize: 16.0,
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
                                        fontSize: 14.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: IconButton(
                                  onPressed: () {
                                    _createCourseController
                                        .deleteCourse(course.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 32,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 32,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
