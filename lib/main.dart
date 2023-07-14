
import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/home/qr_scan.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/profile/follwer/provider/follwer_provider.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:bootcamp_starter/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/util/constants.dart';
import 'features/profile/edit_profile.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreController().initPref();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider<LinkProvider>(
        create: (_) => LinkProvider(),
    ),
          ChangeNotifierProvider<FollwerProvider>(
            create: (_) => FollwerProvider(),
          ),
    ],
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          scaffoldBackgroundColor: kScaffoldColor),
      home:  LoginView(),
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        HomeView.id: (context) => const HomeView(),
        MainAppView.id: (context) => const MainAppView(),
        ProfileView.id: (context) => const ProfileView(),
        ReceiveView.id: (context) => const ReceiveView(),
        EditProfile.id: (context) => const EditProfile(),
        ScanCode.id: (context) =>  ScanCode(),
      },
    ));
  }
}
