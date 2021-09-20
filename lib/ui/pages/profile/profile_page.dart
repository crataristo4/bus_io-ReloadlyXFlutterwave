import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          profile,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: twentyDp,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: twentyDp,
              ),
              Center(
                child: CircleAvatar(
                  radius: fortyDp,
                  backgroundImage: CachedNetworkImageProvider(""),
                ),
              ),
              SizedBox(
                height: sixteenDp,
              ),
              Center(
                child: Text(
                  "adfafa",
                  style: TextStyle(
                      fontSize: twentyDp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: sixteenDp,
              ),
              Center(
                child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                      color: CustomColors.teal.withOpacity(0.1),
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.circular(sixteenDp)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      items('TOTAL TRIPS', 9),
                      VerticalDivider(
                        color: Colors.teal,
                        width: 20,
                        thickness: 0.9,
                        indent: 16,
                        endIndent: 16,
                      ),
                      items('REFERRALS', 2),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: thirtyDp,
              ),
              Padding(
                padding: const EdgeInsets.only(left: sixteenDp),
                child: Text(
                  'ACCOUNT',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: sixteenDp),
                ),
              ),
              callProfileMenu("Profile Settings", () {
                //todo move to profile
              }),
              callProfileMenu("Referrals", () {
                //todo move to referrals
              }),
              Padding(
                padding: const EdgeInsets.only(left: sixteenDp),
                child: Text(
                  appName.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: twentyDp),
                ),
              ),
              callProfileMenu("Terms & Conditions", () {
                //todo move to terms
              }),
              callProfileMenu("Privacy Policy", () {
                //todo move to policy
              }),
              callProfileMenu("FAQs", () {
                //todo move to FAQ
              }),
              callProfileMenu(signOut, () {
                //todo move to FAQ
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget items(title, int points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              color: CustomColors.teal.withOpacity(0.8),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: tenDp,
        ),
        Text(
          "$points",
          style:
              TextStyle(color: CustomColors.teal, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget callProfileMenu(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: twelveDp, horizontal: sixteenDp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: title.contains(signOut) ? Colors.red : Colors.black,
                  fontSize: sixteenDp),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: fourteenDp,
            )
          ],
        ),
      ),
    );
  }
}
