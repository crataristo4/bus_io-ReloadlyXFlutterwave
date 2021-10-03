import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';

class OptionSelector extends StatefulWidget {
  final title, icon;
  final Widget widget;
  final Color textColor;

  const OptionSelector(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.icon,
      required this.widget})
      : super(key: key);

  @override
  _OptionSelectorState createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  @override
  Widget build(BuildContext context) {
    //date card
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: tenDp),
            child: Text(
              widget.title,
              style: TextStyle(color: widget.textColor, fontSize: fourteenDp),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(tenDp),
            ),
            child: Container(
              height: fiftyTwoDp,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(eightDp),
                    child: Image.asset(widget.icon),
                  ),
                  Expanded(child: widget.widget)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
