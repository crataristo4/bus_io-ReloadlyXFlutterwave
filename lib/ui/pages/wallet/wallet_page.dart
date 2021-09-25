import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/points.dart';
import 'package:bus_io/ui/pages/wallet/redeem_gift_cards/redeem_gift_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          wallet,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: sixteenDp, top: tenDp, right: sixteenDp),
            child: Text(
              walletDes,
              style: TextStyle(
                  color: CustomColors.blackCurrency, fontSize: fourteenDp),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
                horizontal: sixteenDp, vertical: sixteenDp),
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(eightDp)),
            child: Padding(
              padding: const EdgeInsets.all(twentyDp),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/loyaltyPoint.svg',
                    // placeholderBuilder: (BuildContext context) => Container(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: tenDp, bottom: tenDp),
                        child: Text(
                          lptBalance,
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: tenDp),
                        child: Text(
                          "1650",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ), //todo get balance from reloadly
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: sixteenDp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              walletButton(transferPoints, () {}),
              walletButton(redeemPoints, () {
                ShowAction.walletPopUp(howToRedeemPoints, mobileTopUp, () {
                  //on mobile top up tapped
                },
                    context,
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: thirtyDp),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              //view gift cards
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RedeemGiftCards()));
                            },
                            child: Text(
                              giftCard,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ));
              }),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recentTrans,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: eighteenDp),
                ),
                Text(
                  viewAll,
                  style:
                      TextStyle(color: CustomColors.teal, fontSize: fourteenDp),
                ),
              ],
            ),
          ),
          buildWalletPoints()
        ],
      ),
    );
  }

  Widget walletButton(String name, Function()? onTap) {
    return Container(
      width: oneFiftyDp,
      height: fortyDp,
      margin: EdgeInsets.symmetric(
        horizontal: tenDp,
      ),
      child: MaterialButton(
        color: CustomColors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(eightDp)),
        onPressed: onTap,
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Expanded buildWalletPoints() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          Points point = pointsList[index];
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.9, color: Colors.grey.withOpacity(0.3))),
            margin:
                EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
            height: eightyDp,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: twentyDp,
                        height: twentyDp,
                        margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                        decoration: BoxDecoration(
                            color: point.isAdded! ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(twentyDp)),
                      ),
                    ),
                    items(date, point.date)
                  ],
                ),
                items(points,
                    point.isAdded! ? '+${point.points}' : '-${point.points}')
              ],
            ),
          );
        },
        itemCount: pointsList.length,
      ),
    );
  }

   Column items(args1, args2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: fourteenDp, bottom: tenDp, right: sixteenDp),
          child: Text(
            args1,
            style: TextStyle(color: Colors.black45, fontSize: sixteenDp),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: sixteenDp),
          child: Text(
            args2,
            style: TextStyle(
                color: Colors.black,
                fontSize: eighteenDp,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
