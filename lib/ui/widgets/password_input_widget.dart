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
              validator: (value) => value!.trim().isNotEmpty || value.length > 9
                  ? null
                  : requireD,
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
}
