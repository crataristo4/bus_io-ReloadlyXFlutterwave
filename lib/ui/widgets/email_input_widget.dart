import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController emailController;

  const EmailInput({Key? key, required this.emailController})
      : super(
          key: key,
        );

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) =>
              EmailValidator.validate(value!) == true ? null : invalidEmail,
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
}
