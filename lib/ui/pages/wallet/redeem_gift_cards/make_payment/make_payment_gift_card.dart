import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/model/point_to_card.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MakePaymentForGiftCard extends StatefulWidget {
  final PointsToGiftCards pointsToGiftCards;

  const MakePaymentForGiftCard({Key? key, required this.pointsToGiftCards})
      : super(key: key);

  @override
  _MakePaymentForGiftCardState createState() => _MakePaymentForGiftCardState();
}

class _MakePaymentForGiftCardState extends State<MakePaymentForGiftCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Make payment from Wallet", () {
        Navigator.pop(context);
      }),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            child: Container(
                              height: 130,
                              width: 180,
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                imageUrl:
                                    widget.pointsToGiftCards.giftCardImageUrl,
                                // height: oneFiftyDp,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(tenDp),
                                    bottomLeft: Radius.circular(tenDp))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: eightDp, left: 8, right: 8),
                                  child: Text(
                                    widget.pointsToGiftCards.productName,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(widget.pointsToGiftCards.currency,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sixteenDp,
                    ),
                    items('Quantity', '${widget.pointsToGiftCards.quantity}'),
                    items('Points', '${widget.pointsToGiftCards.points}'),
                    items('Recipient', '${widget.pointsToGiftCards.receiver}'),
                    items('Sender', '${widget.pointsToGiftCards.sender}'),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/svg/powerbyreloadly.svg',
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        placeholderBuilder: (context) => Container(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: tenDp, horizontal: sixteenDp),
                      child: ButtonWidget(
                        buttonName: 'Make Payment from wallet',
                        onButtonTapped: () async {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget items(args1, args2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            args1,
            style: TextStyle(color: Colors.grey, fontSize: fourteenDp),
          ),
          SizedBox(
            height: eightDp,
          ),
          Text(args2,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: fourteenDp))
        ],
      ),
    );
  }
}
