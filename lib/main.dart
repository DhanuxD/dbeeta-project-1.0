import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_systemo_v01/constant/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/special.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final bool isLoggedIn = await checkIfLoggedIn();

  runApp(MainApp(
    // isLoggedIn: isLoggedIn,
  ));
}
//
// Future<bool> checkIfLoggedIn() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(Special.LOGIN_TOKEN.toString()) == null ? false : true;
// }

class MainApp extends StatelessWidget {
  // final bool isLoggedIn;

  const MainApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  Routes.SPLASH_SCREEN,
      getPages: Routes.getPageRoutes(),
    );
  }
}
