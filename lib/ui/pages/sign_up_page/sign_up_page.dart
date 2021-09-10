import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
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
  bool isVisible = true;

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
  Widget buildNameInput(String hint, TextEditingController controller) {
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
  }

  //email input
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

  //phone number input
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

  //password input
  Widget buildPasswordInput(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: isVisible ? true : false,
          controller: controller,
          validator: (value) =>
              value!.trim().isNotEmpty || value.length > 9 ? null : requireD,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                // onTapDown: hidePass,
                //onTapUp: showPass,
                onTap: setVisibility,
                child: isVisible
                    ? Image.asset('assets/icons/eye-slash.png')
                    : Image.asset('assets/icons/eye.png')),
            hintText: password,
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

  //---
  Widget displayPasswordConfirmation(bool isValid, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      padding: EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isValid
              ? Padding(
                  padding: const EdgeInsets.only(top: fourDp),
                  child: Image.asset('assets/icons/checked.png'),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: fourDp),
                  child: Image.asset('assets/icons/circle.png'),
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: eightDp,
            ),
            child: Text(description),
          )
        ],
      ),
    );
  }

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
                      child: buildNameInput(firstName, firstNameController)),
                  Expanded(child: buildNameInput(lastName, lastNameController)),
                ],
              ),
              SizedBox(
                height: twentyDp,
              ),
              buildEmailInput(emailController),
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
                  Expanded(child: buildPhoneNumberInput(phoneNumberController))
                ],
              ),
              SizedBox(
                height: twentyDp,
              ),
              buildPasswordInput(passwordController),
              SizedBox(
                height: twentyDp,
              ),
              displayPasswordConfirmation(false, miniEightChar),
              displayPasswordConfirmation(false, oneUpper),
              displayPasswordConfirmation(true, oneSpecial),
              SizedBox(
                height: fortyDp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //toggle password visibility
  void setVisibility() {
    setState(() {
      if (isVisible) {
        isVisible = false;
      } else {
        isVisible = true;
      }
    });
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
                child: Text(
                  login,
                  //superscript is usually smaller in size
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: sixteenDp),
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
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: fiftyDp,
            onPressed: () {},
            child: Text(
              signup,
              style: TextStyle(color: Colors.white, fontSize: eighteenDp),
            ),
            color: Colors.teal,
          ),
        ),
        SizedBox(
          height: twentyDp,
        ),
      ],
    );
  }
}
