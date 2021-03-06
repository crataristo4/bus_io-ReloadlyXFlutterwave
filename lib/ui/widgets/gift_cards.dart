import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GiftCardWidget extends StatefulWidget {
  final bool isCardDetails;
  final Content content;
  final Function()? onTap;
  final index;

  const GiftCardWidget(
      {Key? key,
      required this.isCardDetails,
      required this.content,
      required this.onTap,
      required this.index})
      : super(key: key);

  @override
  _GiftCardWidgetState createState() => _GiftCardWidgetState();
}

class _GiftCardWidgetState extends State<GiftCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Container(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  imageUrl: widget.content.logoUrls[0],
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 60,

              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(tenDp),
                      bottomLeft: Radius.circular(tenDp)),
                  border: Border.all(color: Colors.grey, width: 0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Expanded(
                        child: Text(
                          widget.content.productName,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  widget.isCardDetails
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Expanded(
                              child: Text(
                                "${recipientCurrencyCodeValues.reverse[widget.content.recipientCurrencyCode]} ${widget.content.fixedRecipientDenominations[widget.index]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
