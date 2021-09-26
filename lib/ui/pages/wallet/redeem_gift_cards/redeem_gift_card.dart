import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:bus_io/provider/reloadly_provider.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/wallet/redeem_gift_cards/gift_card_details/gift_card_details.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/gift_cards.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//todo reimplement this class
class RedeemGiftCards extends StatefulWidget {
  const RedeemGiftCards({Key? key}) : super(key: key);

  @override
  _RedeemGiftCardsState createState() => _RedeemGiftCardsState();
}

class _RedeemGiftCardsState extends State<RedeemGiftCards> {
  ReloadLyProvider state = ReloadLyProvider();

  @override
  Widget build(BuildContext context) {
    state = Provider.of<ReloadLyProvider>(context);

    return Scaffold(
      backgroundColor: CupertinoColors.white,
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
                Expanded(
                  child: Builder(builder: (context) {
                    //loading
                    if (state.apiState == ApiState.Loading) {
//show progress
                      print('loading');
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    //if there is an error
                    if (state.apiState == ApiState.Error) {
//show progress
                      return Center(child: Text("Sorry! Please try again"));
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 6),
                      itemCount: state.contentList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Content content = state.contentList[index];
                        return GiftCardWidget(
                          content: content,
                          isCardDetails: false,
                          index: null,
                          onTap: () async {
                            Dialogs.showLoadingDialog(
                                context, loadingKey, '', Colors.white);
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.of(context, rootNavigator: false).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GiftCardDetails(content: content),
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

  Widget buildGiftCards(Content content) {
    return GestureDetector(
      onTap: () {
        print("id is ${content.productId}");
        state.fetchCardsById(content.productId);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey.withOpacity(0.3),
                    // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    //    border: Border.all(color: Colors.grey,width: 0.2)
                    ),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  imageUrl: content.logoUrls[0],
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 44,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  border: Border.all(color: Colors.grey, width: 0.2)),
              child: Expanded(
                child: Text(
                  content.productName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
