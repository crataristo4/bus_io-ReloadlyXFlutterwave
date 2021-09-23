import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlideItem extends StatelessWidget {
  final image, title, content;

  const OnboardingSlideItem({
    Key? key,
    this.image,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: tenDp, right: tenDp, bottom: hundredDp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            fit: BoxFit.cover,
            height: 300,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: thirtyDp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: tenDp,
          ),
          Center(
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: sixteenDp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
