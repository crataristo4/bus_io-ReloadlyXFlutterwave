import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/provider/app_api_provider.dart';
import 'package:bus_io/provider/buses_provider.dart';
import 'package:bus_io/provider/cities_provider.dart';
import 'package:bus_io/route_generator.dart';
import 'package:bus_io/services/app_api_service.dart';
import 'package:bus_io/services/booking_service.dart';
import 'package:bus_io/services/user_service.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/bookings.dart';
import 'model/user.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(EntryPoint()));
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserService _userService = UserService.instance;
    BookingsService bookingsService = BookingsService.instance;
    AppApiService _appApi = AppApiService.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppApiProvider()),
        ChangeNotifierProvider(create: (context) => CityProvider()),
        ChangeNotifierProvider(create: (context) => BusesProvider()),
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: FirebaseAuth.instance.currentUser,
        ),
        StreamProvider<List<Users>>.value(
          initialData: [],
          value: _userService.getUsers(),
          lazy: false,
        ),
        StreamProvider<List<Bookings>>.value(
          initialData: [],
          value: bookingsService.getBookings(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal, primarySwatch: Colors.teal),
        initialRoute: initScreen == 0 || initScreen == null
            ? OnboardingPage
                .routeName //shows when app data is cleared or newly installed
            : ConfigPage.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
        //  home: MainPage(),
      ),
    );
  }
}
//....SPRINT 1 .....//
