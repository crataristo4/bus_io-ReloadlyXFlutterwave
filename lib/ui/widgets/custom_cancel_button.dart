import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: fortyDp,
        width: seventyDp,
        decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(tenDp)),
        child: Center(
          child: Text(
            cancel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.customRed,
            ),
          ),
        ),
      ),
    );
  }
}
