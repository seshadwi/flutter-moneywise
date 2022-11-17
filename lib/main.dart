import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/blocs/auth/auth_bloc.dart';
import 'package:moneywise_app/blocs/user/user_bloc.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/data_provider_page.dart';
import 'package:moneywise_app/ui/pages/data_success_page.dart';
import 'package:moneywise_app/ui/pages/history_page.dart';
import 'package:moneywise_app/ui/pages/home_page.dart';
import 'package:moneywise_app/ui/pages/money_planner_create_page.dart';
import 'package:moneywise_app/ui/pages/money_planner_page.dart';
import 'package:moneywise_app/ui/pages/onboarding_page.dart';
import 'package:moneywise_app/ui/pages/pin_page.dart';
import 'package:moneywise_app/ui/pages/profile_edit_page.dart';
import 'package:moneywise_app/ui/pages/profile_edit_pin_page.dart';
import 'package:moneywise_app/ui/pages/profile_edit_success_page.dart';
import 'package:moneywise_app/ui/pages/profile_page.dart';
import 'package:moneywise_app/ui/pages/sign_in_page.dart';
import 'package:moneywise_app/ui/pages/sign_up_page.dart';
import 'package:moneywise_app/ui/pages/sign_up_success_page.dart';
import 'package:moneywise_app/ui/pages/topup_page.dart';
import 'package:moneywise_app/ui/pages/topup_success_page.dart';
import 'package:moneywise_app/ui/pages/transfer_page.dart';
import 'package:moneywise_app/ui/pages/transfer_success_page.dart';

import 'ui/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: lightBgColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBgColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 20,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePageNavbar(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-success': (context) => const TopUpSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-success': (context) => const DataSuccessPage(),
          '/money-planner': (context) => const MoneyPlannerPage(),
          '/money-planner-create': (context) => const MoneyPlannerCreatePage(),
          '/history': (context) => const HistoryPage(),
        },
      ),
    );
  }
}
