import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/login_page/login_page.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:bus_io/ui/pages/search_bus/search_bus_page.dart';
import 'package:bus_io/ui/pages/search_results/search_results_page.dart';
import 'package:bus_io/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ConfigPage.routeName:
        return MaterialPageRoute(builder: (_) => ConfigPage());
      //ONBOARDING
      case OnboardingPage.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      //LOGIN
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
      //SIGN UP
      case SignupPage.routeName:
        return MaterialPageRoute(builder: (_) => SignupPage());
      //MAIN PAGE
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => MainPage());
      //REVIEW BOOKING
      /*case ReviewBookingDetails.routeName:
        return MaterialPageRoute(builder: (_) => ReviewBookingDetails());*/
//search results
      case SearchResultsPage.routeName:
        return MaterialPageRoute(builder: (_) => SearchResultsPage());

      //select seats
      /*   case SelectSeat.routeName:
        return MaterialPageRoute(builder: (_) => SelectSeat());*/
      //add passenger details
      /* case AddPassengerDetails.routeName:
        final data = args as List<String>;
        return MaterialPageRoute(
            builder: (_) => AddPassengerDetails(
                  seatsSelected: data,
                ));*/
      //SEARCH BUS
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
