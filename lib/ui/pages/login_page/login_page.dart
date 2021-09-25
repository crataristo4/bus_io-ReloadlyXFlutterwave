import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/user.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/email_input_widget.dart';
import 'package:bus_io/ui/widgets/password_input_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
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

            Container(
              margin: EdgeInsets.symmetric(horizontal: sixteenDp),
              child: ButtonWidget(
                buttonName: login,
                onButtonTapped: () {
                  anonymousSignup();
                },
              ),
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
                      onTap: () => Navigator.of(context).pop(),
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

  Future<void> anonymousSignup() async {
    if (_formKey.currentState!.validate()) {
      Dialogs.showLoadingDialog(context, loadingKey, settingUp, Colors.white);
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        Users newUser = Users(
            id: FirebaseAuth.instance.currentUser!.uid.toString(),
            email: emailController.text,
            firstName: "Test",
            lastName: "User",
            phoneNumber: "",
            from: '',
            to: '',
            currentCity: "");

        FirebaseFirestore.instance
            .collection("Users")
            .doc(newUser.id)
            .set(newUser.toJson())
            .whenComplete(() {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (route) => false);
        });
      });
    }
  }
}
