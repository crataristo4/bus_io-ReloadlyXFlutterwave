import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/email_input_widget.dart';
import 'package:bus_io/ui/widgets/password_input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //header
          header(),

          SizedBox(
            height: fiftyDp,
          ),

          Center(
              child: Text(
            welcomeBack,
            style: TextStyle(
                fontSize: twentyDp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          )),
          SizedBox(
            height: tenDp,
          ),
          Center(
              child: Text(
            bookABusDes,
            style: TextStyle(
                fontSize: fourteenDp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          )),
          SizedBox(
            height: sixteenDp,
          ),

          EmailInput(emailController: emailController),
          SizedBox(
            height: sixteenDp,
          ),
          PasswordInput(passwordController: passwordController),
          SizedBox(
            height: sixteenDp,
          ),

          ButtonWidget(
            buttonName: login,
            onButtonTapped: () {
              print('log in up');
            },
          ),
          SizedBox(
            height: thirtyDp,
          ),

          Center(
            child: Text(
              forgotPassword,
              style: TextStyle(fontSize: sixteenDp),
            ),
          ),
          SizedBox(
            height: sixteenDp,
          ),
          Center(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: newUser,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Mulish',
                        fontSize: sixteenDp)),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                        SignupPage.routeName, (route) => false),
                    child: Text(
                      createAnAccount,
                      //superscript is usually smaller in size
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: sixteenDp),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: hundredDp),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: appName,
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 40)),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(2, -16),
                child: Text(
                  tm,
                  //superscript is usually smaller in size
                  textScaleFactor: 0.8,
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: sixteenDp),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
