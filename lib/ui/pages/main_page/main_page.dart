import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/ui/pages/bookings/bookings_page.dart';
import 'package:bus_io/ui/pages/home_page/home_page.dart';
import 'package:bus_io/ui/pages/profile/profile_page.dart';
import 'package:bus_io/ui/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BookingsPage(),
    WalletPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(eightDp),
              child: SvgPicture.asset(
                _selectedIndex == 0
                    ? 'assets/svg/home_color.svg'
                    : 'assets/svg/home_grey.svg',
              ),
            ),
            label: home,
            tooltip: home,
          ),
          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(eightDp),
                child: SvgPicture.asset(
                  _selectedIndex == 1
                      ? 'assets/svg/ticket_color.svg'
                      : 'assets/svg/ticket_grey.svg',
                  // placeholderBuilder: (BuildContext context) => Container(),
                ),
              ),
              label: bookings,
              tooltip: bookings),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(eightDp),
              child: SvgPicture.asset(
                //todo add wallet_color.svg
                _selectedIndex == 2
                    ? 'assets/svg/wallet_color.svg'
                    : 'assets/svg/wallet_grey.svg',
                // placeholderBuilder: (BuildContext context) => Container(),
              ),
            ),
            label: wallet,
            tooltip: wallet,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(eightDp),
              child: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/svg/profile_color.svg'
                    : 'assets/svg/profile_grey.svg',
                // placeholderBuilder: (BuildContext context) => Container(),
              ),
            ),
            label: profile,
            tooltip: profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Color(0xFFFFFFFF),
        unselectedItemColor: Color(0xFFAFAFAF),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 0,
        // selectedIconTheme: IconThemeData(color: Colors.teal),
      ),
    );
  }
}
