import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengerDetails extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;
  final Function()? onTap;
  final title;

//  final String itemSelected;
  final List<String> dropDownList;

  const PassengerDetails(
      {Key? key,
      required this.title,
      required this.nameController,
      required this.ageController,
      required this.phoneController,
      required this.onTap,
      // required this.itemSelected,
      required this.dropDownList})
      : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
              child: Text(
                widget.title.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: twentyDp),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  '$iconAssetPrefix$trashIconSuffix',
                  width: thirtyDp,
                ),
                Container(
                  width: ninetyDp,
                  height: fortyDp,
                  margin: EdgeInsets.only(right: sixteenDp, left: twentyFourDp),
                  padding: EdgeInsets.all(sixDp),
                  decoration: BoxDecoration(
                    color: CustomColors.lightTeal.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(eightDp),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: widget.dropDownList[0],
                    dropdownColor: Colors.white,
                    elevation: 0,
                    isExpanded: true,
                    iconEnabledColor: CustomColors.teal,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: twentyDp,
                    ),
                    decoration: InputDecoration.collapsed(hintText: ''),
                    style: TextStyle(color: Color(0xFF424242)),
                    // underline: Container(),
                    items: widget.dropDownList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
                    hint: Text(
                      widget.dropDownList[0],
                      style: TextStyle(color: Color(0xFF757575), fontSize: 16),
                    ),
                    onChanged: (String? value) {
                      setState(() {});
                    },
                    validator: (value) => value == null ? requireD : null,
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: sixteenDp, bottom: sixDp),
          child: Text(
            name,
            style: TextStyle(color: CustomColors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: sixteenDp),
          child: TextFormField(
              keyboardType: TextInputType.name,
              controller: widget.nameController,
              validator: (value) => value!.trim().isNotEmpty ? null : requireD,
              decoration: InputDecoration(
                hintText: enterFullName,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.teal, width: 1),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF5F5F5))),
              )),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: sixteenDp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: sixteenDp,
                      bottom: sixDp,
                    ),
                    child: Text(
                      phone,
                      style: TextStyle(color: CustomColors.black),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: widget.phoneController,
                        validator: (value) =>
                            value!.trim().isNotEmpty || value.length > 10
                                ? null
                                : requireD,
                        decoration: InputDecoration(
                          hintText: enterPhoneNumber,
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColors.teal, width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: tenDp),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: sixDp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: sixteenDp, bottom: sixDp, left: sixDp),
                    child: Text(
                      age,
                      style: TextStyle(color: CustomColors.black),
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(right: sixteenDp),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.ageController,
                        validator: (value) =>
                            value!.trim().isNotEmpty ? null : requireD,
                        decoration: InputDecoration(
                          hintText: enterAge,
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColors.teal, width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: tenDp),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFF5F5F5))),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: sixteenDp,
        )
      ],
    );
  }
}
