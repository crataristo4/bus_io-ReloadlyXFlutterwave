import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final buttonName;
  final Function() onButtonTapped;

  const ButtonWidget(
      {Key? key, required this.buttonName, required this.onButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: fiftyDp,
        onPressed: onButtonTapped,
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.white, fontSize: eighteenDp),
        ),
        color: Colors.teal,
      ),
    );
  }
}
