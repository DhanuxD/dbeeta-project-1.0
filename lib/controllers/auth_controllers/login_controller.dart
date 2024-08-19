import 'package:learning_management_systemo_v01/models/user_model.dart';
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


      if (responseData == 200) {
        emailController.text = '';
        passwordController.text = '';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final response = await AuthServices().getUserIdentity(
            token: prefs.getString(Special.LOGIN_TOKEN.toString()) ?? '');
        isLoading.value = false;
        UserModel user = UserModel.fromJson(response!);
        print('User role--------->: ${user.role}');
        print('USer id ---------->${user.id}');
        print('User role--------->: ${prefs.getString(Special.LOGIN_TOKEN.toString())}');
        prefs.setString(Special.USER_ROLE.toString(), user.role);

        if (user.role == Const.INSTRUCTOR) {
          Get.snackbar("Hello", user.name,
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 1));
          await Future.delayed(const Duration(milliseconds: 300));
          Get.closeAllSnackbars();
          Get.offNamed(Routes.INSTRUCTOR_HOME);
        } else if (user.role == Const.STUDENT) {
          Get.snackbar("Hello", user.name,
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 1));
          await Future.delayed(const Duration(milliseconds: 300));
          print('User role------ssssssssssssss--->: ${user.role}');
          Get.closeAllSnackbars();
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Failed", "Login Failed",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1));
      }
    } else {
      isLoading.value = false;
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
      Get.snackbar("Success", "Logout Successful",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.closeAllSnackbars();
      Get.offAllNamed(Routes.LOGIN);

    } else {
      Get.snackbar("Failed", "Logout Failed",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1));
    }
  }
}
