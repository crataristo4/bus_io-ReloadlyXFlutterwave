import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/ui/pages/onboarding_page/splash_screen.dart';
import 'package:bus_io/ui/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboardingPage';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              OnboardingSlideItem(
                image: "assets/svg/ob1.svg",
                title: bookABus,
                content: bookDes,
              ),
              OnboardingSlideItem(
                image: "assets/svg/ob2.svg",
                title: lpr,
                content: lprDes,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: hundredDp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicatorCount(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: fiftyDp, horizontal: sixteenDp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: twentyDp),
                  child: Text(
                    skip,
                    style: TextStyle(fontSize: sixteenDp, color: Colors.black),
                  ),
                ),
                Container(
                  height: fiftyDp,
                  width: fiftyDp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(thirtyDp),
                    color: CustomColors.teal,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 30 : 8,
      width: 8,
      margin: EdgeInsets.only(right: sixDp),
      decoration: BoxDecoration(
          color:
              isActive ? CustomColors.teal : CustomColors.teal.withOpacity(0.5),
          borderRadius: BorderRadius.circular(fourDp)),
    );
  }

  List<Widget> indicatorCount() {
    List<Widget> indicators = [];
    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        indicators.add(indicator(true));
      } else {
        indicators.add(indicator(false));
      }
    }

    return indicators;
  }

  pushToConfigPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(SplashScreenPage.routeName, (route) => false);
  }
}
