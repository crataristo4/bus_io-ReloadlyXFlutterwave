import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ReferralsPage extends StatefulWidget {
  static const routeName = '/referrals';

  const ReferralsPage({Key? key}) : super(key: key);

  @override
  _ReferralsPageState createState() => _ReferralsPageState();
}

class _ReferralsPageState extends State<ReferralsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Referrals", () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [],
      ),
    );
  }
}
