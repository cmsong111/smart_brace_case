import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/views/auth/login_page.dart';
import 'package:smart_brace_case/src/presentation/views/auth/register_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/main_page.dart';
import 'package:smart_brace_case/src/presentation/views/settings/setting_main.dart';

var appRoute = {
  AppRoute.login: (context) => LoginPage(),
  AppRoute.register: (context) => const RegisterPage(),
  AppRoute.main: (context) => const MainPage(),
  AppRoute.setting: (context) => const SettingMainPage(),
};
