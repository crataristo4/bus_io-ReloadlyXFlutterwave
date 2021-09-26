import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final item;
  final Color color;
  final Color bgColor;
  final Function()? onTap;

  const QuantitySelector(
      {Key? key,
      required this.item,
      required this.onTap,
      required this.color,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 8),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(eightDp)),
        child: Center(
          child: Text(
            item,
            style: TextStyle(color: color, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
