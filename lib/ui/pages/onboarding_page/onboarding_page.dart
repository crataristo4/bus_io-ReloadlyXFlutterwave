import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboardingPage';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    getCounter();
    super.initState();
  }

  getCounter() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.all(thirtyDp),
            height: fourHundredDp,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColors.lightTeal.withOpacity(0.3),
                shape: BoxShape.circle),
            child: Center(
              child: Container(
                width: threeHundredDp,
                height: twoHundredDp,
                decoration: BoxDecoration(
                    color: CustomColors.teal.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: oneFiftyDp,
                    height: hundredDp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: appName,
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -16),
                                child: Text(
                                  tm,
                                  //superscript is usually smaller in size
                                  textScaleFactor: 0.7,
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Text(busBookingMadeEasy,
                            style: TextStyle(
                                color: Colors.teal.withOpacity(0.5),
                                fontSize: tenDp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: twentyDp),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 2.5,
              percent: 1,
              animation: true,
              animationDuration: 1000,
              onAnimationEnd: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(
                      ConfigPage.routeName, (route) => false),
              /*center: Text(
                "$counter",
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),*/
              progressColor: Colors.teal,
            ),
          ),
        )
      ],
    )));
  }
}
