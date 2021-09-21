import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/home_page/home_page.dart';
import 'package:bus_io/ui/pages/login_page/login_page.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:bus_io/ui/pages/profile/referrals/referral_page.dart';
import 'package:bus_io/ui/pages/search_bus/bus_results_page.dart';
import 'package:bus_io/ui/pages/search_city/search_city_page.dart';
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
      //home
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());
//search results
      case BusResultsPage.routeName:
        final data = args as dynamic;
        return MaterialPageRoute(
            builder: (_) => BusResultsPage(
                  to: data,
                  from: data,
                  numberOfPassengers: data,
                  date: data,
                ));

      case ReferralsPage.routeName:
        return MaterialPageRoute(builder: (_) => ReferralsPage());

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
      case SearchCity.routeName:
        bool data = args as bool;
        return MaterialPageRoute(
            builder: (_) => SearchCity(
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
