import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_systemo_v01/services/auth_services.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();

  //------------------->User registration  <------------------//
  Future<void> registerUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final role = roleController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty || role.isEmpty) {
      Get.snackbar("Error", "Every field is required",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    } else if (_isValidEmail(email)) {
      //------------------->User registration request <------------------//
      final responseData = await AuthServices().registerUser(
          name: name, email: email, password: password, role: role);
      if (responseData == 201) {
        emailController.text = '';
        nameController.text = '';
        passwordController.text = '';
        roleController.text = '';
        Get.snackbar("Success", "Register successful",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));

      } else if (responseData == 422) {
        Get.snackbar("Failed", "Check your fields",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      } else {
        Get.snackbar("Failed", "Something went wrong",
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
