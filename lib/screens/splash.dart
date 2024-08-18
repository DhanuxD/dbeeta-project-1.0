import '../utils/imports/import_list.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      getPage();
      // Get.off(() =>  LoginScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: splashScreenAnimation(),
      ),
    );
  }

  Container splashScreenAnimation() {
    return Container(
      color: const Color.fromARGB(0, 100, 98, 98),
      width: Get.width * 0.65,
      height: Get.height * 0.65,
      child: LottieBuilder.asset(
        'assets/animation/splash.json',
        fit: BoxFit.contain,
      ),
    );
  }

  getPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(Special.LOGIN_TOKEN.toString()) == null
        ? Get.offNamed(Routes.LOGIN)
        : Get.offNamed(Routes.HOME);
  }
}
