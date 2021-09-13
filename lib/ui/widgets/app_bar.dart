import 'package:bus_io/constansts/strings.dart';
import 'package:flutter/material.dart';

AppBar appBar(title, Function()? onTap) {
  return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: GestureDetector(
          onTap: onTap, child: Image.asset('$iconAssetPrefix$backBtn')));
}
