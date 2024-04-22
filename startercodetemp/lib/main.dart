import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodetemp/controllers/login_provider.dart';
import 'package:startercodetemp/controllers/onboarding_provider.dart';
import 'package:startercodetemp/controllers/signup_provider.dart';
// Widget defaultHome = const OnBoardingScreen();  Welcome Screen

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final entrypoint = prefs.getBool('entrypoint') ?? false;
  final loggedIn = prefs.getBool('loggedIn') ?? false;
  //  if (entrypoint && !loggedIn) {
  //   defaultHome = const LoginPage();
  // } else if (entrypoint && loggedIn) {
  //   defaultHome = const MainScreen();
  // }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
      ChangeNotifierProvider(create: (context) => LoginNotifier()),
      ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold()); // defaultHome
  }
}
