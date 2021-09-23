import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/buses.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/provider/buses_provider.dart';
import 'package:bus_io/ui/bottom_sheets/filter.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/select_seat/select_seat.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/bus_item.dart';
import 'package:bus_io/ui/widgets/destination_card.dart';
import 'package:bus_io/ui/widgets/modify_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BusResultsPage extends StatefulWidget {
  static const routeName = '/searchBusResultsPage';
  final from, to, date, numberOfPassengers;

  const BusResultsPage(
      {Key? key,
      required this.from,
      required this.to,
      required this.date,
      required this.numberOfPassengers})
      : super(key: key);

  @override
  _BusResultsPageState createState() => _BusResultsPageState();
}

class _BusResultsPageState extends State<BusResultsPage> {
  BusesProvider state = BusesProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<BusesProvider>(context);
    state.fetchBusList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(searchResults, () {
        Navigator.pop(context);
      }),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: sixteenDp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationCard(
              from: widget.from,
              to: widget.to,
              color: Colors.black,
              isCard: true,
            ),
            SizedBox(
              height: tenDp,
            ),
            state.busList.length == 0
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ModifyOrFilter(
                          title: modifyResults,
                          icon: '$iconAssetPrefix$editIcon',
                          onTap: () {
                            ShowAction.showAlertDialog(
                                DestinationCard(
                                    from: widget.from,
                                    to: widget.to,
                                    color: Colors.black,
                              isCard: false),
                          context,
                          alertButton(cancel, Colors.teal,
                              Colors.teal.withOpacity(0.04), 0),
                          alertButton(done, Colors.white, Colors.teal, 1.2));
                    }),
                ModifyOrFilter(
                          title: filterResults,
                          icon: '$iconAssetPrefix$filterIcon',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => FilterBottomSheet(
                                  results: state.busList.length),
                            );
                          })
                    ],
            ),
            SizedBox(
              height: twentyDp,
            ),
            Text(
              '$showing ${state.busList.length} $results',
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                  fontSize: sixteenDp),
            ),
            Expanded(child: Builder(builder: (context) {
              //if there is an error
              if (state.apiState == ApiState.Error) {
//show progress
                return Center(child: Text("Sorry! an error occurred"));
              }

              return state.busList.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        GetBus bus = state.busList[index];

                        return BusItem(
                          bus: bus,
                          isBus: true,
                          isTicket: false,
                          onTap: () async {
                            Dialogs.showLoadingDialog(
                                context, loadingKey, "", Colors.white);
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.pop(context);
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SelectSeat(
                                      bus: bus,
                                      to: widget.to,
                                      from: widget.from,
                                      numberOfPassengers:
                                          widget.numberOfPassengers,
                                  date: widget.date)));
                          },
                          seatsBooked: 0,
                        );

                      },
                      itemCount: state.busList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      primary: false,
                    );
            }))
          ],
        ),
      ),
    );
  }


  Widget buildBusList(GetBus bus) {
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
                    child: Container(
                      width: thirtyDp,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                '${bus.busImage}',
                              ),
                              fit: BoxFit.cover)),
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
                        "${bus.averageRating}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.grayMedium),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: fourDp, right: sixteenDp),
                      child: Text(
                        '(${bus.numberOfRatings})',
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
                  "${DateFormat.yMMMMEEEEd().format(bus.departureDay)}",
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
                    "${bus.estimatedDuration} hrs",
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectSeat(
                          bus: bus,
                              to: widget.to,
                              from: widget.from,
                              date: widget.date,
                              numberOfPassengers: widget.numberOfPassengers,
                            )));
                  },
                  child: Text(
                    viewSeats,
                    style: TextStyle(color: Colors.white, fontSize: sixteenDp),
                  ),
                  color: CustomColors.teal,
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
