import 'package:carrier/di/injector.dart';
import 'package:carrier/presentation/home/home_page.dart';
import 'package:carrier/presentation/home/home_view_model.dart';
import 'package:carrier/presentation/mine/agreement/platform_agreement_page.dart';
import 'package:carrier/presentation/mine/feedback/feedback_page.dart';
import 'package:carrier/presentation/mine/resource/car_add_bind_page.dart';
import 'package:carrier/presentation/mine/resource/car_add_page.dart';
import 'package:carrier/presentation/mine/resource/car_del_page.dart';
import 'package:carrier/presentation/mine/resource/car_edit_page.dart';
import 'package:carrier/presentation/mine/resource/driver_add_page.dart';
import 'package:carrier/presentation/mine/resource/driver_add_search_page.dart';
import 'package:carrier/presentation/mine/resource/driver_del_page.dart';
import 'package:carrier/presentation/mine/resource/driver_edit_page.dart';
import 'package:carrier/presentation/mine/resource/driver_info_bank_card_add_page.dart';
import 'package:carrier/presentation/mine/resource/driver_info_bank_card_agreement_page.dart';
import 'package:carrier/presentation/mine/resource/driver_info_bank_card_info_page.dart';
import 'package:carrier/presentation/mine/resource/driver_info_bank_card_page.dart';
import 'package:carrier/presentation/mine/resource/driver_info_page.dart';
import 'package:carrier/presentation/mine/resource/resource_management_page.dart';
import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:carrier/presentation/mine/settings/settings_page.dart';
import 'package:carrier/presentation/mine/settings/change_password/change_password_page.dart';
import 'package:carrier/presentation/mine/settings/about_us/about_us_page.dart';
import 'package:carrier/presentation/mine/users/users_page.dart';
import 'package:carrier/presentation/mine/users/edit_user_phone/edit_user_phone_page.dart';
import 'package:carrier/presentation/mine/users/edit_user_phone/edit_user_new_phone_page.dart';
import 'package:carrier/presentation/scheduling/scheduling_view_model.dart';
import 'package:carrier/presentation/scheduling/select_car_page.dart';
import 'package:carrier/presentation/scheduling/select_driver_page.dart';
import 'package:carrier/presentation/scheduling/to_be_determined_detail_page.dart';
import 'package:carrier/presentation/splash/splash_page.dart';
import 'package:carrier/presentation/splash/splash_view_model.dart';
import 'package:carrier/presentation/user/login_page.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:carrier/presentation/waybill/new_waybill_page.dart';
import 'package:carrier/presentation/waybill/waybill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user/user_view_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(
              repository: Injector.singleton.provideUserRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          Constants.splashPage: (context) => ChangeNotifierProvider(
                create: (_) => SplashViewModel(
                  repository: Injector.singleton.provideSplashRepository(),
                ),
                child: SplashPage(),
              ),
          Constants.loginPage: (context) => LoginPage(),
          Constants.homePage: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) => HomeViewModel(
                        repository: Injector.singleton.provideHomeRepository()),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => SchedulingViewModel(
                        repository:
                            Injector.singleton.provideSchedulingRepository()),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => WaybillViewModel(
                        repository:
                            Injector.singleton.provideWaybillRepository()),
                  )
                ],
                child: HomePage(),
              ),
          Constants.toBeDeterminedDetailPage: (context) =>
              ToBeDeterminedDetailPage(),
          Constants.carSchedulingPage: (context) => SelectCarPage(),
          Constants.driverSchedulingPage: (context) => SelectDriverPage(),
          Constants.newWaybillPage: (context) => NewWaybillPage(),
          Constants.usersPage: (context) => UsersPage(),
          Constants.editUserPhonePage: (context) => EditUserPhonePage(),
          Constants.editUserNewPhonePage: (context) => EditUserNewPhonePage(),
          Constants.settingsPage: (context) => SettingsPage(),
          Constants.changePasswordPage: (context) => ChangePasswordPage(),
          Constants.aboutUsPage: (context) => AboutUsPage(),
          Constants.feedbackPage: (context) => FeedbackPage(),
          Constants.agreementPage: (context) => PlatformAgreementPage(),
          Constants.resourcePage: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => ResourceManagementViewModel(),
                  )
                ],
                child: ResourceManagementPage(),
              ),
          Constants.carAddPage: (context) => CarAddPage(),
          Constants.carAddBindPage: (context) => CarAddBindPage(),
          Constants.carDelPage: (context) => CarDelPage(),
          Constants.carEditPage: (context) => CarEditPage(),
          Constants.driverAddPage: (context) => DriverAddPage(),
          Constants.driverAddSearchPage: (context) => DriverAddSearchPage(),
          Constants.driverDelPage: (context) => DriverDelPage(),
          Constants.driverEditPage: (context) => DriverEditPage(),
          Constants.driverInfoPage: (context) => DriverInfoPage(),
          Constants.driverInfoBankCardPage: (context) =>
              DriverInfoBankCardPage(),
          Constants.driverInfoBankAddCardPage: (context) =>
              DriverInfoBankCardAddPage(),
          Constants.driverInfoBankCardAgreementPage: (context) =>
              DriverInfoBankCardAgreementPage(),
          Constants.driverInfoBankCardInfoPage: (context) =>
              DriverInfoBankCardInfoPage()
        },
        initialRoute: Constants.splashPage,
      ),
    );
  }
}
