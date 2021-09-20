import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/user.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/login_page/login_page.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/email_input_widget.dart';
import 'package:bus_io/ui/widgets/name_input.dart';
import 'package:bus_io/ui/widgets/password_input_widget.dart';
import 'package:bus_io/ui/widgets/phone.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signupPage';

  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedCountryCode = '+233';

  //method to select country code when changed
  void _onCountryChange(CountryCode countryCode) {
    selectedCountryCode = countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          createAnAccount,
          style: TextStyle(
              color: Colors.black, fontFamily: 'Mulish', fontSize: twentyDp),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first column
                Expanded(child: buildFirstColumn()),

                //second column
                buildSecondColumn()
              ],
            ),
          )
        ],
      ),
    );
  }

  //user name input
/*  Widget buildNameInput(String hint, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.name,
          controller: controller,
          validator: (value) =>
          value!.trim().isNotEmpty || value.length > 3 ? null : requireD,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: CustomColors.lightTeal.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade400, width: 1),
            ),
            contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
          )),
    );
  }*/

  /* //email input
  Widget buildEmailInput(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          validator: (value) =>
          EmailValidator.validate(value!) == true ? null : requireD,
          decoration: InputDecoration(
            hintText: email,
            fillColor: CustomColors.lightTeal.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade400, width: 1),
            ),
            contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
          )),
    );
  }
*/
  //phone number input
/*
  Widget buildPhoneNumberInput(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.phone,
          controller: controller,
          validator: (value) =>
              value!.trim().isNotEmpty || value.length > 9 ? null : requireD,
          decoration: InputDecoration(
            hintText: phoneNumber,
            fillColor: CustomColors.lightTeal.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade400, width: 1),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
          )),
    );
  }
*/

  //first column
  Widget buildFirstColumn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: twentyDp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: NameInput(
                          hint: firstName, controller: firstNameController)),
                  Expanded(
                      child: NameInput(
                          hint: lastName, controller: lastNameController)),
                ],
              ),
              SizedBox(
                height: twentyDp,
              ),
              EmailInput(
                emailController: emailController,
              ),
              SizedBox(
                height: twentyDp,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: CustomColors.lightTeal.withOpacity(0.4)),
                    width: 100,
                    height: 60,
                    child: CountryCodePicker(
                      //country code
                      onChanged: _onCountryChange,
                      showFlag: false,
                      showDropDownButton: true,
                      initialSelection: selectedCountryCode,
                      showOnlyCountryWhenClosed: false,
                    ),
                  ),
                  Expanded(
                      child: PhoneNumberInput(
                    controller: phoneNumberController,
                  ))
                ],
              ),
              SizedBox(
                height: twentyDp,
              ),
              PasswordInput(passwordController: passwordController),
              SizedBox(
                height: twentyDp,
              ),
              SizedBox(
                height: fortyDp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSecondColumn() {
    return Column(
      children: [
        SizedBox(
          height: twelveDp,
        ),
        Center(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: alreadyHaveAccount,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Mulish',
                      fontSize: sixteenDp)),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginPage.routeName, (route) => false),
                  child: Text(
                    login,
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
        SizedBox(
          height: eightDp,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: sixteenDp),
          child: ButtonWidget(
            buttonName: signup,
            onButtonTapped: () async => await anonymousSignup(),
          ),
        ),
        SizedBox(
          height: twentyDp,
        ),
      ],
    );
  }

  Future<void> anonymousSignup() async {
    if (_formKey.currentState!.validate()) {
      Dialogs.showLoadingDialog(context, loadingKey, settingUp, Colors.white);
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        Users newUser = Users(
            id: FirebaseAuth.instance.currentUser!.uid.toString(),
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            phoneNumber: "$selectedCountryCode${phoneNumberController.text}");

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
