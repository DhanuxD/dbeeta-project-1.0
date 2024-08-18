// import '../utils/imports/import_list.dart';
//
// class InstructorHomeScreen extends StatelessWidget {
//    InstructorHomeScreen({super.key});
//   final LoginController _authController = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return  PopScope(
//       canPop: false,
//       onPopInvoked: (didPop) {
//        Get.close(1);
//       },
//       child: Scaffold(
//        appBar: AppBar(
//          title: Center(
//            child: CustomLabel().customLabel(
//                text: 'D-Beeta Instructor',
//                fontSize: 24,
//                color: Colors.blueAccent),
//          ),
//          automaticallyImplyLeading: false,
//          backgroundColor: Colors.white,
//          actions: [
//            PopupMenuButton<int>(
//              onSelected: (value) async {
//                if (value == 0) {
//                } else if (value == 1) {}
//              },
//              itemBuilder: (context) => [
//                const PopupMenuItem(
//                  value: 0,
//                  child: Text("My Account"),
//                ),
//                const PopupMenuItem(
//                  value: 1,
//                  child: Text("Courses"),
//                ),
//              ],
//              icon: const Icon(Icons.more_vert),
//            ),
//            IconButton(
//              onPressed: () async {
//                _authController.logoutUser();
//              },
//              icon: const Icon(Icons.logout),
//            ),
//          ],
//        ),
//       ),
//     );
//   }
// }
import '../utils/imports/import_list.dart';

class InstructorHomeScreen extends StatelessWidget {
  InstructorHomeScreen({super.key});

  final LoginController _authController = Get.find<LoginController>();

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
                } else if (value == 1) {
                }
              },
              itemBuilder: (context) =>
              [
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
        body: Center(
          child: Text(
            'Instructor Dashboard',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
