import 'package:learning_management_systemo_v01/screens/instructor_home.dart';

import '../utils/imports/import_list.dart';

class Routes {
  static const LOGIN = "/login";
  static const SPLASH_SCREEN = "/splash";
  static const HOME = "/home";
  static const INSTRUCTOR_HOME = "/instructorHome";
  static const REGISTER = '/register';

  static List<GetPage> getPageRoutes() {
    return [
      GetPage(name: SPLASH_SCREEN, page: () => const SplashScreen()),
      GetPage(name: LOGIN, page: () => LoginScreen()),
      GetPage(name: REGISTER, page: () => const RegisterScreen()),
      GetPage(name: HOME, page: () => const HomeScreen()),
      GetPage(name: INSTRUCTOR_HOME, page: () =>  InstructorHomeScreen()),
    ];
  }
}
