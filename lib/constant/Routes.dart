import 'dart:collection';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:learning_management_systemo_v01/screens/home.dart';
import 'package:learning_management_systemo_v01/screens/login.dart';
import 'package:learning_management_systemo_v01/screens/register.dart';
import 'package:learning_management_systemo_v01/screens/splash.dart';

class Routes {
  static const LOGIN = "/login";
  static const SPLASH_SCREEN = "/splash";
  static const HOME = "/home";
  static const REGISTER = '/register';

  static List<GetPage> getPageRoutes() {
    return [
      GetPage(name: SPLASH_SCREEN, page: () => const SplashScreen()),
      GetPage(name: LOGIN, page: () => LoginScreen()),
      GetPage(name: REGISTER, page: () => const RegisterScreen()),
      GetPage(name: HOME, page: () => const HomeScreen()),
    ];
  }
}
