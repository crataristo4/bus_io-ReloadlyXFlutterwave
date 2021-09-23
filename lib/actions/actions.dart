import 'dart:ui';

import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowAction {
  //get date
  Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)));

  void showToast(message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: sixteenDp);
  }

  static void showAlertDialog(
      Widget content, BuildContext context, Widget widgetA, Widget widgetB) {
    var alertDialog = AlertDialog(
      content: content,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actions: <Widget>[widgetA, widgetB],
    );

    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: true,
    );
  }

  static void showDetails(String title, Color titleColor, String content,
      Color contentColor, BuildContext context, Widget widgetA) {
    var alertDialog = AlertDialog(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: titleColor,
              fontSize: fourteenDp),
          textAlign: TextAlign.center),
      content: Text(content,
          style: TextStyle(
              color: contentColor,
              fontWeight: FontWeight.w500,
              fontSize: fourteenDp),
          textAlign: TextAlign.center),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(twentyDp)),
      actions: <Widget>[widgetA],
    );

    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: true,
    );
  }

  static void walletPopUp(String title, String content,
      Function()? onContentTap, BuildContext context, Widget widgetA) {
    var alertDialog = AlertDialog(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              fontSize: fourteenDp),
          textAlign: TextAlign.center),
      content: GestureDetector(
        onTap: onContentTap,
        child: Text(content,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: fourteenDp),
            textAlign: TextAlign.center),
      ),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(twentyDp)),
      actions: <Widget>[widgetA],
    );

    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: true,
    );
  }

  static Future<void> makePhoneCall(String? url) async {
    if (await canLaunch(url!)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
