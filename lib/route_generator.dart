import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/login_page/login_page.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:bus_io/ui/pages/search_bus/search_bus_page.dart';
import 'package:bus_io/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ConfigPage.routeName:
        return MaterialPageRoute(builder: (_) => ConfigPage());
      case OnboardingPage.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case SignupPage.routeName:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => MainPage());
      case SearchBus.routeName:
        bool data = args as bool;
        return MaterialPageRoute(
            builder: (_) => SearchBus(
                  isFrom: data,
                ));

      default:
        return _errorRoute();
    }
  }

  //error page ..
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text("Page not Found"),
        ),
      );
    });
  }
}
