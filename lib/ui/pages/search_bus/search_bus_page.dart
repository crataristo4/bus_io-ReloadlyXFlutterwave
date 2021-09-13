import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/places.dart';
import 'package:bus_io/ui/pages/home_page/home_page.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class SearchBus extends StatefulWidget {
  final bool isFrom;
  static const routeName = '/searchBus';

  const SearchBus({Key? key, required this.isFrom}) : super(key: key);

  @override
  _SearchBusState createState() => _SearchBusState();
}

class _SearchBusState extends State<SearchBus> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  bool _isSearch = true;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('', () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          //search input
          buildSearchInput(),
          SizedBox(
            height: tenDp,
          ),
          //search list

          Expanded(
            flex: 1,
            child: ListView.builder(
              itemBuilder: (context, index) {
                Places bus = placeList[index];
                return buildBusResults(bus);
              },
              itemCount: placeList.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              primary: true,
            ),
          ),
        ],
      ),
    );
  }

  //method to search category and sort grid list
  /* Widget _searchList() {
    _searchListItems = <String>[];

    for (int i = 0; i < _busListItems!.length; i++) {
      var item = _busListItems![i];


      if (item.placeName!.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchListItems!.add(item);
      }
    }
    return buildSearchResults();
  }*/

  Widget buildSearchInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.text,
          controller: searchController,
          validator: (value) => value!.isNotEmpty ? null : requireD,
          decoration: InputDecoration(
            hintText: widget.isFrom ? whereAreYouHeaded : whereAreYouGoingTo,
            fillColor: CustomColors.lightTeal.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.focusBorder, width: 0.6),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF5F5F5))),
          )),
    );
  }

  Widget buildBusResults(Places bus) {
    return GestureDetector(
      onTap: () {
        if (!widget.isFrom) {
          setState(() {
            HomePage.fromLocation = bus.placeName!;
          });
        } else {
          HomePage.toLocation = bus.placeName!;
        }
        Navigator.of(context).pop();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: sixteenDp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: eightDp),
              child: Text(
                '${bus.placeName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.teal,
                    fontSize: sixteenDp),
              ),
            ),
            bus.placeLocation!.trim().isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: fourDp, left: eightDp),
                    child: Text(
                      '${bus.placeLocation}',
                      style: TextStyle(color: Colors.grey, fontSize: twelveDp),
                    ),
                  )
                : Container(),
            Divider()
          ],
        ),
      ),
    );
  }

/*  Widget buildSearchResults() {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Bus bus = _searchListItems[index];
          print('object .. ${bus.placeName}');
          return buildBusResults(bus);
        },
        itemCount: _searchListItems.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        primary: true,
      ),
    );
  }*/
}
