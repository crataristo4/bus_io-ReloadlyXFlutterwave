import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordInput({Key? key, required this.passwordController})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = true;
  bool isNumeric = false,
      isSpecialChar = false,
      isUpperCase = false,
      isMinNumber = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: Column(
        children: [
          TextFormField(
              keyboardType: TextInputType.text,
              obscureText: isVisible ? true : false,
              controller: widget.passwordController,
              validator: (value) =>
                  value!.trim().isNotEmpty && isPasswordCompliant(value)
                      ? null
                      : requireD,
              onChanged: (value) => isPasswordCompliant(value),
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
          displayPasswordConfirmation(isMinNumber, miniEightChar),
          displayPasswordConfirmation(isUpperCase, oneUpper),
          displayPasswordConfirmation(isSpecialChar, oneSpecial),
        ],
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

  //---
  Widget displayPasswordConfirmation(bool isValid, String description) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: sixteenDp),
      padding: EdgeInsets.all(8),
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

  //password checker
  bool isPasswordCompliant(String password, [int minLength = 8]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    if (hasUppercase) {
      setState(() {
        isUpperCase = true;
      });
    } else {
      setState(() {
        isUpperCase = false;
      });
    }
    // bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (hasSpecialCharacters) {
      setState(() {
        isSpecialChar = true;
      });
    } else {
      setState(() {
        isSpecialChar = false;
      });
    }
    bool hasMinLength = password.length > minLength;
    if (hasMinLength) {
      setState(() {
        isMinNumber = true;
      });
    } else {
      setState(() {
        isMinNumber = false;
      });
    }
    return //hasDigits &
        hasUppercase &
            // hasLowercase &
            hasSpecialCharacters &
            hasMinLength;
  }
}
