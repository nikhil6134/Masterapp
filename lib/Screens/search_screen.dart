import 'package:flutter/material.dart';
import 'package:masterapp/widgets/custom_switch.dart';
import 'package:masterapp/widgets/search.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  var search;
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select the type for",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "GST Number Search Tool",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSwitch(),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(height * 0.22),
          ),
        ),
        body: Search(formkey: _formkey));
  }
}
