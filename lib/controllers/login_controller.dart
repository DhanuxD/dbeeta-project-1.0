// // import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:learning_management_systemo_v01/services/remote/auth_services.dart';
// import '../constant/Routes.dart';
import '../utils/imports/import_list.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and Password are required",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    } else if (_isValidEmail(email)) {
      final responseData =
          await AuthServices().loginUser(email: email, password: password);
      if (responseData == 200) {

        emailController.text = '';
        passwordController.text = '';
        Get.snackbar("Success", "Login successful",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
        Get.toNamed(Routes.HOME);
      } else {
        Get.snackbar("Failed", "Login Failed",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      }
    } else {
      Get.snackbar("Error", "Invalid Email",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
