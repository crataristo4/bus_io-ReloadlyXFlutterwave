import 'package:bus_io/constansts/dimens.dart';
import 'package:flutter/material.dart';

class ModifyOrFilter extends StatelessWidget {
  final title, icon;
  final Function()? onTap;

  const ModifyOrFilter({Key? key, this.title, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
