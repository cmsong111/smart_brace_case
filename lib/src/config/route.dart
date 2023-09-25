import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/views/auth/login_page.dart';
import 'package:smart_brace_case/src/presentation/views/auth/register_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/main_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/start_page.dart';

var appRoute = {
  AppRoute.start: (context) => const StartPage(title: 'Flutter Demo Home Page'),
  AppRoute.login: (context) => LoginPage(),
  AppRoute.register: (context) => const RegisterPage(),
  AppRoute.main: (context) => const MainPage(),
};
