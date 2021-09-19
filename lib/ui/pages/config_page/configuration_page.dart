import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///checks if the user is already logs in
class ConfigPage extends StatefulWidget {
  static const routeName = '/configPage';

  const ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool isLoggedIn = false;

  @override
  void initState() {
    var user = Provider.of<User?>(context, listen: false);
    isLoggedIn = user != null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("?? $isLoggedIn");
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            child: SafeArea(
                top: false,
                bottom: false,
                child:
                    Scaffold(body: isLoggedIn ? MainPage() : SignupPage()))));
  }

/* getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("isLoggedIn")!;
  }*/
}
