import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/wallet/redeem_gift_cards/redeem_points/redeem_points.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/gift_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GiftCardDetails extends StatefulWidget {
  final Content content;

  const GiftCardDetails({Key? key, required this.content}) : super(key: key);

  @override
  _GiftCardDetailsState createState() => _GiftCardDetailsState();
}

class _GiftCardDetailsState extends State<GiftCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(availableGiftCards, () {
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
                Expanded(
                  child: Builder(builder: (context) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 0),
                      itemCount:
                      widget.content.fixedRecipientDenominations.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GiftCardWidget(
                          content: widget.content,
                          index: index,
                          isCardDetails: true,
                          onTap: () async {
                            //show details
                            Dialogs.showLoadingDialog(
                                context, loadingKey, '', Colors.white);
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.of(context, rootNavigator: false).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RedeemPoints(
                                      content: widget.content, index: index),
                                ));
                          },
                        );
                      },
                    );
                  }),
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/powerbyreloadly.svg',
                    placeholderBuilder: (context) => Container(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
