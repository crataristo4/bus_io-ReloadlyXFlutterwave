import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/cities.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/provider/cities_provider.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCity extends StatefulWidget {
  final bool isFrom;
  static const routeName = '/searchBus';

  const SearchCity({Key? key, required this.isFrom}) : super(key: key);

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  CityProvider state = CityProvider();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<CityProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('', () {
        Navigator.pop(context);
      }),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //search input
            buildSearchInput(),
            SizedBox(
              height: tenDp,
            ),
            //search list

            Expanded(
              flex: 1,
              child: Builder(builder: (context) {
                if (state.apiState == ApiState.Initial) {
//show progress
                  return Center(
                    child: Text("Please search a city"),
                  );
                }
                //loading
                if (state.apiState == ApiState.Loading) {
//show progress
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                //if there is an error
                if (state.apiState == ApiState.Error) {
//show progress
                  return Center(child: Text("Sorry! Please try again"));
                }

                return isSearching
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          GetCity cities = state.cityList[index];

                          // Places bus = placeList[index];
                          return buildCityResults(cities);
                        },
                        itemCount: isSearching ? state.cityList.length : 0,
                        shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          primary: true,
                        )
                      : Center(
                          child: Text("Please search a city"),
                        );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      child: TextFormField(
          keyboardType: TextInputType.text,
          controller: searchController,
          onChanged: (value) {
            if (_formKey.currentState!.validate()) {
              setState(() {
                isSearching = true;
                // CALL API
                state.fetchCityList();
              });
            } else {
              setState(() {
                isSearching = false;
              });
            }
          },
          validator: (value) =>
              value!.isNotEmpty && value.length > 2 ? null : requireD,
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

  Widget buildCityResults(GetCity city) {
    return GestureDetector(
      onTap: () {
        // add value to db anonymously
        state.saveCity(city.cityName, widget.isFrom);

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
                '${city.cityName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.teal,
                    fontSize: sixteenDp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: fourDp, left: eightDp),
              child: Text(
                countryNameValues.reverse[city.countryName]!,
                style: TextStyle(color: Colors.grey, fontSize: twelveDp),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
