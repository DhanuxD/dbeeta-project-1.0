import '../utils/imports/import_list.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  Future<bool> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Special.LOGIN_TOKEN.toString()) == null
        ? false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');

      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: CustomLabel().customLabel(
                text: 'Login', fontSize: 32, color: AppColors.appPurple),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                Obx(() {
                  return loginController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            loginController.loginUser();
                          },
                          child: CustomLabel().customLabel(
                            fontSize: 16,
                            text: 'Login',
                            color: AppColors.appPurple,
                          ),
                        );
                }),
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
        ),
      ),
    );
  }
}
