import 'dart:ui';

import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/quantity_selector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class RedeemPoints extends StatefulWidget {
  final Content content;
  final index;

  const RedeemPoints({Key? key, required this.content, required this.index})
      : super(key: key);

  @override
  _RedeemPointsState createState() => _RedeemPointsState();
}

class _RedeemPointsState extends State<RedeemPoints> {
  int _quantitySelected = 1;
  bool isChecked = false;

  void _increment() {
    setState(() {
      _quantitySelected++;
    });
  }

  void _decrement() {
    if (_quantitySelected > 1) {
      setState(() {
        _quantitySelected--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(redeemGiftCards, () {
        Navigator.pop(context);
      }),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: '$pointToDollar ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            // default text style
                            children: [
                              TextSpan(
                                  text: minimumConvert,
                                  style: TextStyle(color: CustomColors.teal)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: sixteenDp,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 220,
                              width: 200,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    child: Container(
                                      height: 120,
                                      width: 250,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        imageUrl: widget.content.logoUrls[0],
                                        // height: oneFiftyDp,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(tenDp),
                                            bottomLeft:
                                                Radius.circular(tenDp))),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: eightDp, left: 8, right: 8),
                                          child: Text(
                                            widget.content.productName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Text(
                                              "${recipientCurrencyCodeValues.reverse[widget.content.recipientCurrencyCode]} ${widget.content.fixedRecipientDenominations[widget.index].toString()}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 100, left: sixteenDp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$quantity $_quantitySelected',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      QuantitySelector(
                                        item: "-",
                                        color: Colors.black,
                                        bgColor: Colors.grey.withOpacity(0.3),
                                        onTap: _decrement,
                                      ),
                                      QuantitySelector(
                                        item: "+",
                                        color: Colors.white,
                                        bgColor: CustomColors.teal,
                                        onTap: _increment,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          requiredPoints,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: fourDp,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 0.9)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: eightDp),
                              child: Text("500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sixteenDp,
                        ),
                        textTy(
                            '*eGift voucher is non-refundable / exchange and cannot be exchanged for cash or full and is valid for a single transaction only.'),
                        SizedBox(
                          height: tenDp,
                        ),
                        textTy(
                            '**eGift vouchers cannot be replaced if lost, stolen or damaged.'),
                        SizedBox(
                          height: tenDp,
                        ),
                        textTy(
                            '**eGift vouchers are valid till the claim-by-date.'),
                        SizedBox(
                          height: tenDp,
                        ),
                        textTy(
                            '*eGift vouchers only to be to used in their specific region.'),
                        SizedBox(
                          height: tenDp,
                        ),
                        textTy(
                            '*eGift will be under terms and conditions of their brands.'),
                        SizedBox(
                          height: tenDp,
                        ),
                        Text(
                          'For any discrepancy or complains, kindly send your request to: support@reloadly.com',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: tenDp,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },

                              checkColor: Colors.white,
                              // activeColor:Colors.white ,
                              tristate: false,
                              side: BorderSide(color: CustomColors.teal),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    'By clicking ‘Add Recipient’, you agree to our Terms and Condition, including our Cancellation Policy'),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: SvgPicture.asset(
                            'assets/svg/powerbyreloadly.svg',
                            placeholderBuilder: (context) => Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: sixteenDp, vertical: tenDp),
                    child: ButtonWidget(
                      buttonName: 'Add Recipients',
                      onButtonTapped: () {},
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

  Widget textTy(String args) {
    return Text(args,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey));
  }
}
