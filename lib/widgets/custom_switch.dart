import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:masterapp/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ToggleSwitch(
      labels: ["Search GST Number", "GST Return Status"],
      minWidth: width * 0.60,
      minHeight: height * 0.065,
      initialLabelIndex: 0,
      curve: Curves.fastLinearToSlowEaseIn,
      totalSwitches: 2,
      cornerRadius: 25,
      inactiveBgColor: Color(0xFF1a884b),
      activeBgColor: [Colors.white, Colors.white],
      inactiveFgColor: Colors.white70,
      activeFgColor: kPrimarycolor,
      radiusStyle: true,
      animate: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
