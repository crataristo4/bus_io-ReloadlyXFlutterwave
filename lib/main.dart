import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/route_generator.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(EntryPoint()));
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      initialRoute: initScreen == 0 || initScreen == null
          ? OnboardingPage
              .routeName //shows when app data is cleared or newly installed
          : MainPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
      //  home: MainPage(),
    );
  }
}
//....SPRINT 1 .....//