import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<State> loadingKey = new GlobalKey<State>();

///checks if the user is already logs in
class ConfigPage extends StatefulWidget {
  static const routeName = '/configPage';

  const ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool isLoggedIn = false;
  User? _user;

  @override
  void initState() {
    _user = Provider.of<User?>(context, listen: false);
    isLoggedIn = _user != null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
                body: isLoggedIn
                    ? MainPage(
                        selectedIndex: 0,
                      )
                    : SignupPage())));
  }

/* getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("isLoggedIn")!;
  }*/
}
