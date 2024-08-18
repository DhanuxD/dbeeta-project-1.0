import 'utils/imports/import_list.dart';

void main() async {
  Get.lazyPut(()=>LoginController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: Routes.getPageRoutes(),
    );
  }
}
