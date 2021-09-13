import 'dart:ui';

import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowAction {
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

  static void showDetails(
      String title, String content, BuildContext context, Widget widgetA) {
    var alertDialog = AlertDialog(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center),
      content: Text(content,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
