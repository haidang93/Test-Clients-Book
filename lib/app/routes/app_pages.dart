import 'package:get/get.dart';

import 'package:clientsbook/app/modules/analysis/bindings/analysis_binding.dart';
import 'package:clientsbook/app/modules/analysis/views/analysis_view.dart';
import 'package:clientsbook/app/modules/calendar/bindings/calendar_binding.dart';
import 'package:clientsbook/app/modules/calendar/views/calendar_view.dart';
import 'package:clientsbook/app/modules/clients/bindings/clients_binding.dart';
import 'package:clientsbook/app/modules/clients/views/clients_view.dart';
import 'package:clientsbook/app/modules/home/bindings/home_binding.dart';
import 'package:clientsbook/app/modules/home/views/home_view.dart';
import 'package:clientsbook/app/modules/login/forgot_password/bindings/forgot_password_binding.dart';
import 'package:clientsbook/app/modules/login/forgot_password/views/forgot_password_view.dart';
import 'package:clientsbook/app/modules/login/login/bindings/login_binding.dart';
import 'package:clientsbook/app/modules/login/login/views/login_view.dart';
import 'package:clientsbook/app/modules/login/sign_up/bindings/sign_up_binding.dart';
import 'package:clientsbook/app/modules/login/sign_up/views/sign_up_view.dart';
import 'package:clientsbook/app/modules/my_services/bindings/my_services_binding.dart';
import 'package:clientsbook/app/modules/my_services/views/my_services_view.dart';
import 'package:clientsbook/app/modules/setting/bindings/setting_binding.dart';
import 'package:clientsbook/app/modules/setting/views/setting_view.dart';
import 'package:clientsbook/app/modules/startup/bindings/startup_binding.dart';
import 'package:clientsbook/app/modules/startup/views/startup_view.dart';
import 'package:clientsbook/app/modules/support/bindings/support_binding.dart';
import 'package:clientsbook/app/modules/support/views/support_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.STARTUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STARTUP,
      page: () => StartupView(),
      binding: StartupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTS,
      page: () => ClientsView(),
      binding: ClientsBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.ANALYSIS,
      page: () => AnalysisView(),
      binding: AnalysisBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MY_SERVICES,
      page: () => MyServicesView(),
      binding: MyServicesBinding(),
    ),
  ];
}
