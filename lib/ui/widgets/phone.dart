import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:flutter/material.dart';

class PhoneNumberInput extends StatefulWidget {
  final controller;

  const PhoneNumberInput({Key? key, required this.controller})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.phone,
          controller: widget.controller,
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
}
