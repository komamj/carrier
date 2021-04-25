import 'package:carrier/di/injector.dart';
import 'package:carrier/presentation/home/home_page.dart';
import 'package:carrier/presentation/home/home_view_model.dart';
import 'package:carrier/presentation/login/login_page.dart';
import 'package:carrier/presentation/mine/agreement/platform_agreement_page.dart';
import 'package:carrier/presentation/mine/feedback/feedback_page.dart';
import 'package:carrier/presentation/mine/resource/resource_management_page.dart';
import 'package:carrier/presentation/mine/settings/settings_page.dart';
import 'package:carrier/presentation/mine/users/users_page.dart';
import 'package:carrier/presentation/mine/users/edit_user_phone/edit_user_phone_page.dart';
import 'package:carrier/presentation/mine/users/edit_user_phone/edit_user_new_phone_page.dart';
import 'package:carrier/presentation/scheduling/scheduling_view_model.dart';
import 'package:carrier/presentation/splash/splash_page.dart';
import 'package:carrier/presentation/splash/splash_view_model.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/user_view_model.dart';
import 'util/constants.dart';

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
                  )
                ],
                child: HomePage(),
              ),
          Constants.usersPage: (context) => UsersPage(),
          Constants.editUserPhonePage: (context) => EditUserPhonePage(),
          Constants.editUserNewPhonePage: (context) => EditUserNewPhonePage(),
          Constants.settingsPage: (context) => SettingsPage(),
          Constants.feedbackPage: (context) => FeedbackPage(),
          Constants.agreementPage: (context) => PlatformAgreementPage(),
          Constants.resourcePage: (context) => ResourceManagementPage(),
        },
        initialRoute: Constants.splashPage,
      ),
    );
  }
}
