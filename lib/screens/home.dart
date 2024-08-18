import '../utils/imports/import_list.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController _authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Learning Management System",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyanAccent,
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) {
                if (value == 0) {
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
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
