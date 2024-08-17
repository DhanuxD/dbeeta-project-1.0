// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:learning_management_systemo_v01/constant/Routes.dart';
// import 'package:learning_management_systemo_v01/constant/app_colors.dart';
// import 'package:learning_management_systemo_v01/utils/styles/font_style.dart';
// import 'package:learning_management_systemo_v01/utils/styles/input_decorations.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../controllers/login_controller.dart';
// import '../enums/special.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends StatelessWidget {
//   final LoginController loginController = Get.put(LoginController());
//
//   LoginScreen({super.key});
//
//   Future<bool> checkIfLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(Special.LOGIN_TOKEN.toString()) == null
//         ? false
//         : true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Center(
//           child: Text("Login"),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: loginController.emailController,
//               decoration: InputDec.inputDec(label: 'email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: loginController.passwordController,
//               decoration: InputDec.inputDec(label: 'password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 loginController.loginUser();
//               },
//               child: CustomLabel().customLabel(
//                 fontSize: 16,
//                 text: 'Login',
//                 color: AppColors.appPurple,
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Get.toNamed(Routes.REGISTER);
//               },
//               child: CustomLabel().customLabel(
//                   text: 'Don\'t have an account? Register',
//                   fontSize: 16,
//                   color: AppColors.appPurple),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_systemo_v01/constant/Routes.dart';
import 'package:learning_management_systemo_v01/constant/app_colors.dart';
import 'package:learning_management_systemo_v01/utils/styles/font_style.dart';
import 'package:learning_management_systemo_v01/utils/styles/input_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/login_controller.dart';
import '../enums/special.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  Future<bool> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Special.LOGIN_TOKEN.toString()) == null ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Center(
          child: CustomLabel().customLabel(text: 'Login', fontSize: 32, color: AppColors.appPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/loginimg.png',
              width: screenWidth * 0.6,
              height: screenHeight * 0.3,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: loginController.emailController,
              decoration: InputDec.inputDec(label: 'email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: loginController.passwordController,
              decoration: InputDec.inputDec(label: 'password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginController.loginUser();
              },
              child: CustomLabel().customLabel(
                fontSize: 16,
                text: 'Login',
                color: AppColors.appPurple,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: CustomLabel().customLabel(
                  text: 'Don\'t have an account? Register',
                  fontSize: 16,
                  color: AppColors.appPurple),
            ),
          ],
        ),
      ),
    );
  }
}
