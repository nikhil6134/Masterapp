import 'package:flutter/material.dart';
import 'package:masterapp/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FirstTile extends StatelessWidget {
  const FirstTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: true,
              afterLineStyle:
                  LineStyle(color: kPrimaryLightcolor, thickness: 3),
              indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: kPrimaryLightcolor,
                  padding: EdgeInsets.all(8),
                  iconStyle: IconStyle(
                      fontSize: 26,
                      color: kPrimarycolor,
                      iconData: Icons.fmd_good)),
              endChild: Padding(
                padding: EdgeInsets.only(top: 30),
                child: ListTile(
                  title: Text(
                    "Principal Place of Business",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "K-37 floor, Mandoli Industrial Area, North East, Delhi, Delhi, 110093",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isLast: true,
              beforeLineStyle:
                  LineStyle(color: kPrimaryLightcolor, thickness: 3),
              indicatorStyle: IndicatorStyle(
                width: 40,
                color: kPrimaryLightcolor,
                iconStyle: IconStyle(
                    fontSize: 26,
                    color: kPrimarycolor,
                    iconData: Icons.account_balance_sharp),
              ),
              endChild: Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                  title: Text(
                    "Additional Place of Business",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Floor",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
