import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/views/auth/login_page.dart';
import 'package:smart_brace_case/src/presentation/views/auth/register_page.dart';
import 'package:smart_brace_case/src/presentation/views/detal/notice_detail_page.dart';
import 'package:smart_brace_case/src/presentation/views/detal/notice_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/find_my_iot.dart';
import 'package:smart_brace_case/src/presentation/views/main/main_page.dart';
import 'package:smart_brace_case/src/presentation/views/settings/account/account_main.dart';
import 'package:smart_brace_case/src/presentation/views/settings/infomation/infomation_main.dart';
import 'package:smart_brace_case/src/presentation/views/settings/infomation/open_source_licenses.dart';
import 'package:smart_brace_case/src/presentation/views/settings/setting_main.dart';

var appRoute = {
  AppRoute.login: (context) => LoginPage(),
  AppRoute.register: (context) => const RegisterPage(),
  AppRoute.main: (context) => const MainPage(),
  AppRoute.map: (context) => const FindMyIotPage(),
  AppRoute.setting: (context) => const SettingMainPage(),
  AppRoute.settingAccount: (context) => const AccountMainPage(),
  AppRoute.settingInfomaion: (context) => const InfomationMainPage(),
  AppRoute.openSource: (context) => const OpenSourceLicensePage(),
  AppRoute.notice: (context) => const NoticePage(),
  AppRoute.article: (context) => const NoticeDetailPage(),
};
