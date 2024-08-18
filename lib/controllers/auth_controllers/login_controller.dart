import '../../utils/imports/import_list.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and Password are required",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    } else if (_isValidEmail(email)) {
      isLoading.value = true;

      final responseData =
          await AuthServices().loginUser(email: email, password: password);
      isLoading.value = true;

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

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await AuthServices()
        .logoutUser(prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
    if (response == 200) {
      print(
          'Login token before clear: ${prefs.getString(Special.LOGIN_TOKEN.toString())}');
      prefs.clear();
      print(
          'Login token after clear: ${prefs.getString(Special.LOGIN_TOKEN.toString())}');
      Get.snackbar("Failed", "Logout Successful",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));

      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Failed", "Logout Failed",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    }
  }
}
