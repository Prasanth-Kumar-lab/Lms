import 'package:get/get.dart';

import '../views/login_screen.dart';
import '../views/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => const SplashScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
  ];
}
