import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bus.dart';
import 'package:bus_io/model/places.dart';
import 'package:bus_io/ui/bottom_sheets/filter.dart';
import 'package:bus_io/ui/pages/search_bus/search_bus_page.dart';
import 'package:bus_io/ui/pages/select_seat/select_seat.dart';
import 'package:bus_io/ui/widgets/destination_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({Key? key}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String edit = 'edit.png';
  String filter = 'filter.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          searchResults,
          style: TextStyle(
              fontSize: twentyFourDp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('$iconAssetPrefix$backBtn')),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: sixteenDp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: twentyDp,
            ),
            DestinationCard(
              from: placeList[1].placeName,
              to: placeList[1].placeLocation,
              color: Colors.black,
              isCard: true,
            ),
            SizedBox(
              height: sixteenDp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                modifyOrFilterCard(modifyResults, '$iconAssetPrefix$edit', () {
                  ShowAction.showAlertDialog(
                      DestinationCard(
                          from: placeList[1].placeName,
                          to: placeList[1].placeLocation,
                          color: Colors.black,
                          isCard: false),
                      context,
                      alertButton(cancel, Colors.teal,
                          Colors.teal.withOpacity(0.04), 0),
                      alertButton(done, Colors.white, Colors.teal, 1.2));
                }),
                modifyOrFilterCard(filterResults, '$iconAssetPrefix$filter',
                    () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => FilterBottomSheet(),
                  );
                })
              ],
            ),
            SizedBox(
              height: thirtyDp,
            ),
            Text(
              '$showing 10 $results',
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                  fontSize: sixteenDp),
            ),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Bus bus = busList[index];

                    return buildBusList(bus);
                  },
                  itemCount: busList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  primary: true,
                ))
          ],
        ),
      ),
    );
  }

  Widget modifyOrFilterCard(title, icon, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: oneSixtyDp,
        // margin: EdgeInsets.symmetric(horizontal: tenDp),
        padding: EdgeInsets.all(twelveDp),
        decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.02),
            borderRadius: BorderRadius.circular(tenDp)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: eightDp, right: fourDp),
              child: Text(
                title,
                style:
                TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              icon,
              width: thirtyDp,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBusList(Bus bus) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.69),
          borderRadius: BorderRadius.circular(twentyDp)),
      margin: EdgeInsets.symmetric(vertical: sixteenDp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: fourDp, top: eightDp),
                    child: Image.asset(
                      bus.busImage,
                      width: thirtyDp,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: sixDp, top: fourteenDp),
                    child: Text(
                      bus.source.toString().toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: eightDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: fourDp, right: fourDp),
                      child: Text(
                        "${bus.rating}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.grayMedium),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: fourDp, right: sixteenDp),
                      child: Text(
                        '(${bus.numberOfRating})',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.grayMedium),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: twelveDp,
          ),
          //day and bus name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: sixteenDp,
                ),
                child: Text(
                  bus.departureDay,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: twelveDp),
                child: Text(
                  bus.busName,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          //departure time and seats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: sixteenDp),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$departs ',
                        style: TextStyle(
                            color: CustomColors.grayMedium,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mulish',
                            fontSize: sixteenDp)),
                    WidgetSpan(
                      child: Text(
                        bus.departureTime,
                        //superscript is usually smaller in size
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: fifteenDp),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: eightDp),
                child: Text(
                  "${bus.numberOfSeats} Seats",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          //estimated time
          Padding(
            padding: const EdgeInsets.only(left: sixteenDp),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '$estimatedDuration ',
                    style: TextStyle(
                        color: CustomColors.grayMedium,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mulish',
                        fontSize: sixteenDp)),
                WidgetSpan(
                  child: Text(
                    bus.estimatedTime,
                    //superscript is usually smaller in size
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fifteenDp),
                  ),
                ),
              ]),
            ),
          ),

          // SizedBox(height: fiftyDp,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: sixteenDp, top: twentyFourDp, bottom: tenDp),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/free.png',
                          width: 120,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sixteenDp),
                    child: Text(
                      '${bus.remainingSeats.length} $seatsAvailable',
                      //superscript is usually smaller in size
                      style: TextStyle(
                          color: CustomColors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: fifteenDp),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: thirtyDp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: sixteenDp),
                      child: Text(
                        priceTicket,
                        style: TextStyle(color: CustomColors.grayMedium),
                      ),
                    ),
                    SizedBox(
                      height: tenDp,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'N',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                                // fontFamily: 'Mulish',
                                fontSize: eighteenDp)),
                        WidgetSpan(
                          child: Text(
                            '${bus.price}',
                            //superscript is usually smaller in size
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w500,
                                fontSize: eighteenDp),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: twentyDp,
          ),

          Image.asset('assets/images/line.png'),

          SizedBox(
            height: twentyDp,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: sixteenDp, bottom: tenDp, top: thirtyDp),
                child: Text(
                  viewTicketDetails,
                  style: TextStyle(
                      color: CustomColors.grayMedium, fontSize: sixteenDp),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: sixDp),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(eightDp)),
                  minWidth: oneTwentyDp,
                  height: fiftyDp,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SelectSeat()));
                  },
                  child: Text(
                    viewSeats,
                    style: TextStyle(color: Colors.white, fontSize: eighteenDp),
                  ),
                  color: Colors.teal.withOpacity(0.7),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget alertButton(
      title, Color titleColor, Color bgColor, double borderWidth) {
    return GestureDetector(
      onTap: () {
        if (title.toString().contains(cancel)) {
          Navigator.of(context).pop();
        } else {
          //todo
        }
      },
      child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: sixteenDp, vertical: sixteenDp),
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(eightDp),
            color: bgColor,
          ),
          // margin: EdgeInsets.symmetric(horizontal: sixteenDp),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: titleColor, fontWeight: FontWeight.w400),
            ),
          )),
    );
  }
}
